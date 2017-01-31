# Description:
#   Interact with your Jenkins CI server
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_JENKINS_URL
#   HUBOT_JENKINS_AUTH
#
#   Auth should be in the "user:password" format.
#
# Commands:
#   hubot jenkins b <jobNumber> - builds the job specified by jobNumber. List jobs to get number.
#   hubot jenkins build <job> - builds the specified Jenkins job
#   hubot jenkins build <job>, <params> - builds the specified Jenkins job with parameters as key=value&key2=value2
#   hubot jenkins list <filter> - lists Jenkins jobs
#   hubot jenkins describe <job> - Describes the specified Jenkins job
#   hubot jenkins last <job> - Details about the last build for the specified Jenkins job

#
# Author:
#   dougcole
# Modified:
#   latec (removed inability to call builds under folders)

querystring = require 'querystring'

# Holds a list of jobs, so we can trigger them with a number
# instead of the job's name. Gets populated on when calling
# list.
jobList = []

jenkinsBuildById = (msg) ->
  # Switch the index with the job name
  job = jobList[parseInt(msg.match[1]) - 1]

  if job
    msg.match[1] = job
    jenkinsBuild(msg)
  else
    msg.reply "I couldn't find that job. Try `jenkins list` to get a list."

jenkinsBuild = (msg, buildWithEmptyParameters) ->
  url = process.env.HUBOT_JENKINS_URL
  #latec: job = querystring.escape msg.match[1]
  job = msg.match[1]
  jobs = []
  if (job.match('^/')) # remove leading "/"
    job = job.substr(1,job.length)

  if (job.match('/job/'))
    jobs = job.split("/job/")
  else if (job.match('/'))
    jobs = job.split("/")
  else
    jobs.push(job)
  jobpath = ""
  for j in jobs
    jobpath += "/job/" + querystring.escape j
  #latec: added delay parameter and simplified other ways also
  params = msg.match[3] || "?delay=0sec"
  command = if buildWithEmptyParameters then "/buildWithParameters" else "/build"
  path = "#{url}#{jobpath}#{command}#{params}"
  
  req = msg.http(path)

  if process.env.HUBOT_JENKINS_AUTH
    auth = new Buffer(process.env.HUBOT_JENKINS_AUTH).toString('base64')
    req.headers Authorization: "Basic #{auth}"

  req.header('Content-Length', 0)
  req.post() (err, res, body) ->
    if err
      msg.reply "Jenkins says: #{err}"
    else if 200 <= res.statusCode < 400 # Or, not an error code.
      msg.reply "Build started for **#{job}**"
    else if 400 == res.statusCode
      jenkinsBuild(msg, true)
    else if 404 == res.statusCode
      msg.reply "Job *#{job}* not found, double check that it exists and is spelt correctly."
    else
      msg.reply "Jenkins says: Status #{res.statusCode} #{body}"

jenkinsDescribe = (msg) ->
  url = process.env.HUBOT_JENKINS_URL
  job = msg.match[1]
  #latec: added same functionality as in build
  jobs = []
  if (job.match('/job/'))
    jobs = job.split("/job/")
  else if (job.match('/'))
    jobs = job.split("/")
  else
    jobs.push(job)
  jobpath = ""
  for j in jobs
    jobpath += "/job/" + querystring.escape j

  path = "#{url}#{jobpath}/api/json"

  req = msg.http(path)

  if process.env.HUBOT_JENKINS_AUTH
    auth = new Buffer(process.env.HUBOT_JENKINS_AUTH).toString('base64')
    req.headers Authorization: "Basic #{auth}"

  req.header('Content-Length', 0)
  req.get() (err, res, body) ->
    if err
      msg.send "Jenkins says: #{err}"
    else
      response = ""
      try
        content = JSON.parse(body)
        response += "JOB: #{content.displayName}\n"
        response += "URL: #{content.url}\n"

        if content.description
          response += "DESCRIPTION: #{content.description}\n"

        response += "ENABLED: #{content.buildable}\n"
        response += "STATUS: #{content.color}\n"

        tmpReport = ""
        if content.healthReport.length > 0
          for report in content.healthReport
            tmpReport += "\n  #{report.description}"
        else
          tmpReport = " unknown"
        response += "HEALTH: #{tmpReport}\n"

        parameters = ""
        for item in content.actions
          if item.parameterDefinitions
            for param in item.parameterDefinitions
              tmpDescription = if param.description then " - #{param.description} " else ""
              tmpDefault = if param.defaultParameterValue then " (default=#{param.defaultParameterValue.value})" else ""
              parameters += "\n  #{param.name}#{tmpDescription}#{tmpDefault}"

        if parameters != ""
          response += "PARAMETERS: #{parameters}\n"

        msg.send response

        if not content.lastBuild
          return

        path = "#{url}#{jobpath}/#{content.lastBuild.number}/api/json"
        req = msg.http(path)
        if process.env.HUBOT_JENKINS_AUTH
          auth = new Buffer(process.env.HUBOT_JENKINS_AUTH).toString('base64')
          req.headers Authorization: "Basic #{auth}"

        req.header('Content-Length', 0)
        req.get() (err, res, body) ->
          if err
            msg.send "Jenkins says: #{err}"
          else
            response = ""
            try
              content = JSON.parse(body)
              console.log(JSON.stringify(content, null, 4))
              jobstatus = content.result || 'PENDING'
              jobdate = new Date(content.timestamp);
              response += "LAST JOB: #{jobstatus}, #{jobdate}\n"

              msg.send response
            catch error
              msg.send error

      catch error
        msg.send error

jenkinsLastById = (msg) ->
  # Switch the index with the job name
  job = jobList[parseInt(msg.match[1]) - 1]

  if job
    msg.match[1] = job
    jenkinsLast(msg)
  else
    msg.reply "I couldn't find that job. Try `jenkins list` to get a list."

jenkinsLast = (msg) ->
  url = process.env.HUBOT_JENKINS_URL
  job = msg.match[1]
  #latec: added same functionality as in build
  jobs = []
  if (job.match('^/')) # remove leading "/"
    job = job.substr(1,job.length)
  
  if (job.match('/job/'))
    jobs = job.split("/job/")
  else if (job.match('/'))
    jobs = job.split("/")
  else
    jobs.push(job)
  jobpath = ""
  for j in jobs
    jobpath += "/job/" + querystring.escape j

  path = "#{url}#{jobpath}/lastBuild/api/json"

  req = msg.http(path)

  if process.env.HUBOT_JENKINS_AUTH
    auth = new Buffer(process.env.HUBOT_JENKINS_AUTH).toString('base64')
    req.headers Authorization: "Basic #{auth}"

  req.header('Content-Length', 0)
  req.get() (err, res, body) ->
    if err
      msg.send "Jenkins says: #{err}"
    else
      response = ""
      try
        content = JSON.parse(body)
        response += "NAME: #{content.fullDisplayName}\n"
        response += "URL: #{content.url}\n"

        if content.description
          response += "DESCRIPTION: #{content.description}\n"

        #response += "BUILDING: #{content.building}\n"
        #latec:
        response += "TIMESTAMP: #{new Date(content.timestamp)}\n"
        response += "DURATION: #{parseInt(content.duration/1000/60)} min #{parseInt(content.duration/1000%60)} sec\n"
        response += "RESULT: #{content.result}\n"

        msg.send response

jenkinsListJobsRecur = (content,filter,level,parentpath) ->
  response = ""
  for job in content.jobs
    if job._class.match(/Folder$/i)
      if (filter.test job.name) or (filter.test state)
        if level>0
          response += "  " for i in [1..level]
        response += "* :open_file_folder: **#{job.name}**\n"
        level++
        response += jenkinsListJobsRecur(job,filter,level,"#{parentpath}/#{job.name}")
        level--
    else
      # Add the job to the jobList
      index = jobList.indexOf("#{parentpath}/#{job.name}")
      if index == -1
        jobList.push("#{parentpath}/#{job.name}")
        index = jobList.indexOf("#{parentpath}/#{job.name}")

      state = if job.color == "red"
                ":red_circle:"
              else if job.color == "aborted"
                "ABORTED"
              else if job.color == "aborted_anime"
                "CURRENTLY RUNNING"
              else if job.color == "red_anime"
                "CURRENTLY RUNNING"
              else if job.color == "blue_anime"
                "CURRENTLY RUNNING"
              else ":large_blue_circle:"

      if (filter.test job.name) or (filter.test state)
        if level>0
          response += "  " for i in [1..level]
        response += "* [#{index + 1}] **#{job.name}** #{state}\n"
  return response

jenkinsList = (msg) ->
  url = process.env.HUBOT_JENKINS_URL
  filter = new RegExp(msg.match[2], 'i')
  #latec: get deeper list: req = msg.http("#{url}/api/json")
  req = msg.http("#{url}/api/json?depth=3&tree=jobs[name,color,jobs[name,color,jobs[name,color]]]")
  
  if process.env.HUBOT_JENKINS_AUTH
    auth = new Buffer(process.env.HUBOT_JENKINS_AUTH).toString('base64')
    req.headers Authorization: "Basic #{auth}"

  req.get() (err, res, body) ->
    if err
      msg.send "Jenkins says: #{err}"
    else
      try
        content = JSON.parse(body)
        response = jenkinsListJobsRecur(content,filter,0,"")
        msg.send response
      catch error
        msg.send error

jenkinsClear = (msg) ->
  jobList = []
  jenkinsList(msg)

module.exports = (robot) ->

  robot.hear /([\w\.\-_ /]+) build ([0-9]+) failed/i, (res) ->
    job = res.match[1]
    res.send ":red_circle: Oh no?! Job **#{job}** needs looking after! :eyes:"
  robot.hear /([\w\.\-_ /]+) build ([0-9]+) .*was fixed/i, (res) ->
    job = res.match[1]
    res.send ":green_heart: Yay! Making waves here. :sparkles: :tada:"

  robot.respond /j(?:enkins)? b (\d+)/i, (msg) ->
    jenkinsBuildById(msg)
    
  #latec: added "/" to job name matching
  robot.respond /j(?:enkins)? build ([\w\.\-_ /]+)(, (.+))?/i, (msg) ->
    jenkinsBuild(msg, false)

  robot.respond /j(?:enkins)? desc(?:ribe)? (.*)/i, (msg) ->
    jenkinsDescribe(msg)

  robot.respond /j(?:enkins)? l (\d+)/i, (msg) ->
    jenkinsLastById(msg)
  
  robot.respond /j(?:enkins)? last (.*)/i, (msg) ->
    jenkinsLast(msg)

  robot.respond /j(?:enkins)? list( (.+))?/i, (msg) ->
    jenkinsList(msg)

  robot.respond /j(?:enkins)? clear( (.+))?/i, (msg) ->
    jenkinsClear(msg)

  robot.jenkins = {
    list: jenkinsList,
    build: jenkinsBuild
    describe: jenkinsDescribe
    last: jenkinsLast
  }
