USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[tasaarvoindikaattori_r]    Script Date: 8.4.2020 15:45:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[tasaarvoindikaattori_r]
GO

/****** Object:  StoredProcedure [dbo].[tasaarvoindikaattori_r]    Script Date: 8.4.2020 15:45:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE PROCEDURE [dbo].[tasaarvoindikaattori_r] (@ala_koodi nvarchar(20), @sektori nvarchar(20))
AS
EXEC sp_execute_external_script
	@language = N'R',
	@script = N'

##############################################################################

# poistettu kielimuuttuja, jotta väkeä riittää profiileihin
# muokattu SES-pisteytys vastaamaan Otuksen indikaattoria
# tehty luuppi, joka tekee mallin ja poimii variaatiokertoimet liukuvasti n+1 vuoden pätkissä
# muutettu koulutusalat02 OKM ohjausaloiksi
# vaihdettu ala rajausehdosta vasteeksi ja sektori (klaji) rajaukseksi
# lisätty yo-vasteen laskenta koko joukolle
# huomioitu rivit joilla "uusi > 1"
# vaihdettu inputiksi sa-näkymä, joka päivitetään aina aineiston K2.23 saapuessa

##########################################################################

  library(tidyr)
  library(dplyr)

# tallennetaan "InputDataSet" (määrittely koodin lopussa)

  df <- InputDataSet
  df[] <- lapply(df, as.character)		# muutetaan arvot merkkijonoiksi, faktorisoidaan malliin tulevat jäljempänä

  df$tilastovuosi <- as.numeric(df$tilv)		# tilastovuosi ja uusien määrä tarvitaan numeerisena
  df$uusi <- as.numeric(df$uusi)

  df <- df[rep(seq_len(nrow(df)), df$uusi), ]		# kukin havainto omalle rivilleen; aineistossa rivejä joilla uusi > 1
  df$uusi <- 1
  
# otetaan talteen tarkasteltava sektori ja vasteena toimiva OKM ohjauksenala

  sektori <- df$sektori[1]
  vaste_ala_koodi <- df$vaste_ala_koodi[1]
  
#---------alue-, sukupuoli- ja kielimuuttuja----------

  # aluemuuttuja (kaupunkimainen = 2, taajaan asuttu = 1, maaseutumainen = 0)

  df$alue <- as.numeric(df$kuntaryhma_koodi)		# ennen: kaupunkimainen = 1, taajaan asuttu = 2, maaseutumainen = 3
  df$alue <- abs(df$alue - 3)						# jälkeen: kaupunkimainen = 2, taajaan asuttu = 1, maaseutumainen = 0
  df$alue <- as.factor(df$alue)
  
  # sukupuoli (mies = 1, nainen = 0)

  df$mies <- as.numeric(df$sp)						# ennen: mies = 1, nainen = 2		
  df$mies[df$mies != 1] <- 0						# jälkeen: mies = 1, nainen = 0
  df$mies <- as.factor(df$mies)

  ## kielimuuttuja poistettu (sen kanssa ei tullut havaintoja kaikkiin profiileihin)
  ## aidinkielimuuttuja (suomi/saame/ruotsi = 1, muu/tuntematon = 0)
  ##
  ## df$kielifisv <- df$aikielir1x
  ## df$kielifisv[!(df$kielifisv %in% c("fs", "sv"))] <- "0"
  ## df$kielifisv[df$kielifisv %in% c("fs", "sv")] <- "1"
  ## df$kielifisv <- as.factor(as.numeric(df$aikielir1x))

#------------SES-lukuun tarvittavat muuttujat-----------

  # koulutuskoodin ensimmäisen numeron perusteella vanhempien koulutustaso (väh. ylempi amk/kk = 1, muu = 0)

  df$koul_isa <- substr(df$koulk_isa, 1, 1)
  df$koul_isa <- as.numeric(df$koul_isa)
  df$koul_isa[!(df$koul_isa %in% c(7,8))] <- 0
  df$koul_isa[df$koul_isa %in% c(7,8)] <- 1

  df$koul_aiti <- substr(df$koulk_aiti, 1, 1)
  df$koul_aiti <- as.numeric(df$koul_aiti)
  df$koul_aiti[!(df$koul_aiti %in% c(7,8))] <- 0
  df$koul_aiti[df$koul_aiti %in% c(7,8)] <- 1
  
  # vanhempien sosioekonominen asema (ylempi toimihlö / yrittäjä (pl. maatalous) = 1, muu = 0)

  df$sose_isa <- as.numeric(df$sose_isa2)
  df$sose_isa[!(df$sose_isa %in% c(20, 31, 32, 33, 34))] <- 0
  df$sose_isa[df$sose_isa %in% c(20, 31, 32, 33, 34)] <- 1

  df$sose_aiti <- as.numeric(df$sose_aiti2)
  df$sose_aiti[!(df$sose_aiti %in% c(20, 31, 32, 33, 34))] <- 0
  df$sose_aiti[df$sose_aiti %in% c(20, 31, 32, 33, 34)] <- 1
  
  # vanhempien tuloluokka (tulodesiili 8-10 = 1, muu = 0)

  df$tulot_isa <- df$tulo_isa
  df$tulot_isa[!(df$tulot_isa %in% c("08", "09", "10"))] <- "0"
  df$tulot_isa[df$tulot_isa %in% c("08", "09", "10")] <- "1"
  df$tulot_isa <- as.numeric(df$tulot_isa)

  df$tulot_aiti <- df$tulo_aiti
  df$tulot_aiti[!(df$tulot_aiti %in% c("08", "09", "10"))] <- "0"
  df$tulot_aiti[df$tulot_aiti %in% c("08", "09", "10")] <- "1" 
  df$tulot_aiti <- as.numeric(df$tulot_aiti)

#-----------------SES-luku---------------------

  df$SES <- df$koul_isa + df$koul_aiti + df$sose_isa + df$sose_aiti + df$tulot_isa + df$tulot_aiti
  df$SES3 <- as.factor(as.numeric(cut(df$SES, breaks = c(0, 2, 4, 6), include.lowest = TRUE, right = TRUE)))

  ## Hienojakoisemmalla 0-12-luokituksella vaihtoehtona myös:
  ## df$SES4 <- cut(df$SES, breaks = c(0, 3, 6, 9, 12), include.lowest = TRUE, right = TRUE)

#------------vastemuuttuja------------

  # kaikki alat -> yliopisto = 1, amk = 0; muuten The ala = 1, muut = 0 (sektori rajattu inputissa)

  if (sektori == "YO/AMK") {
	df$yo <- as.numeric(df$klaji)  
    df$yo[df$yo != 51] <- 0
    df$yo[df$yo == 51] <- 1
  } else {
    df$yo <- as.numeric(df$OKM_ohjauksen_ala_koodi)  
	df$yo[df$yo != vaste_ala_koodi] <- 0
	df$yo[df$yo == vaste_ala_koodi] <- 1
  }

  df$yo <- as.factor(df$yo)

##################################################################################
# Malli(t) luodaan alla olevien funktioiden jälkeen.
##################################################################################
#---------------- VALMISFUNKTIOT ----------------

  getRIndicator <-
  function(formula,
           sampleData,
           sampleWeights  = rep(1, nrow(sampleData)),
           sampleStrata   = NULL,
           family         = c(''binomial'', ''gaussian''),
           withPartials   = TRUE,
           withPartialCV  = TRUE,
           otherVariables = character())
  {
    
    nSample = nrow(sampleData)
    stopifnot(length(sampleWeights) == nSample)
    stopifnot(is.numeric(sampleWeights))
    
    # If sampleStrata is not defined, use sampleWeights to guess the values of
    # sampleStrata.
    if (is.null(sampleStrata))
      sampleStrata <- getSampleStrata(sampleWeights)
    
    stopifnot(is.factor(sampleStrata))
    stopifnot(length(sampleStrata) == nSample)
    
    sampleDesign <- getSampleDesign(sampleWeights, sampleStrata)
    
    family <- match.arg(family)
    model <- switch(family,
                    ''binomial'' = list(
                      formula = formula,
                      grad    = function(mu)  exp(mu) / (1 + exp(mu))^2,
                      family  = binomial(link = ''logit'')),
                    ''gaussian'' = list(
                      formula = formula,
                      grad    = function(mu) 1,
                      family  = gaussian(link = ''identity'')))
    
    indicator <- getRSampleBased(model, sampleData, sampleDesign)
    
    if ((withPartials) | (withPartialCV))
      estpartials <- getPartialRs(
        indicator, sampleData, sampleDesign, otherVariables)
    if (withPartials) 
      indicator$partialR <- estpartials$partialR	
    if (withPartialCV)
      indicator$partialCV <- estpartials$partialCV
    
    return (indicator)
  } #--
  
  getRSampleBased <-
  function(model,
           sampleData,
           sampleDesign)
  { #++
    # Determines the sample-based R-indicator.
    
    #  See 9.9 from Regression Modelling Strategies (Harrell, 2001) for a
    #  motivation for the factor
    #
    #    mean(sampleWeights) = sum(sampleWeights) / length(sampleWeights).
    
    sampleData <- within(sampleData, {
      sampleWeights <- sampleDesign$weights
      sampleWeights <- sampleWeights / mean(sampleWeights) })
    
    modelfit <- glm(model$formula, model$family, sampleData, sampleWeights)
    prop     <- predict(modelfit, type = ''response'')
    propMean <- weighted.mean(prop, sampleDesign$weights)
    propVar  <- weightedVar(prop, sampleDesign$weights)
    
    # Because estimaters of bias and variance both use the following vectors
    # and matrix, they are calculated only once and passed to the functions.
    sigma <- vcov(modelfit)
    x <- model.matrix(model$formula, sampleData)[, colnames(sigma)]
    z <- model$grad(predict(modelfit, type = ''link'')) * x
    
    withBiasAndVar <- !is.null(sigma) && all(!is.na(sigma))
    if (withBiasAndVar) {
      RBias <- getBiasRSampleBased(prop, z, sigma, sampleDesign)
      RVar  <- getVarianceRSampleBased(prop, z, sigma, sampleDesign)
      
      # To simplify formulas the bias correction of the variance will be
      # written as a factor, 1 - bias / (variance of propensities).
      if (RBias > propVar)
        RBiasFactor <- 0
      else
        RBiasFactor <- 1 - RBias / propVar
    } else {
      RBias <- NA
      RBiasFactor <- NA
      RVar <- NA
    }
    
    CVUnadj <- sqrt(propVar) / propMean
    CV <- sqrt(propVar * RBiasFactor)/propMean
    CVVar <- 0.25 * RVar / propMean^2 + CV^4 / nrow(sampleData)
    
    indicator <- list(
      type          = ''R-indicator, sample based'',
      sampleDesign  = sampleDesign,
      prop          = prop,
      propMean      = propMean,
      model         = model,
      modelfit      = modelfit,
      sigma         = sigma,
      z             = z,
      R             = 1 - 2 * sqrt(propVar * RBiasFactor),
      RUnadj        = 1 - 2 * sqrt(propVar),
      RSE           = sqrt(RVar),
      RBiasFactor   = RBiasFactor,
      CVUnadj       = CVUnadj,
      CV			  = CV,
      CVSE          = sqrt(CVVar))
    
    return (indicator)
  } #--


getBiasRSampleBased <-
  function(prop,
           z,
           sigma,
           sampleDesign)
  { #++
    # Estimates the bias of the estimator for the variance of the
    # propensities.
    
    nPopulation <- sum(sampleDesign$weights)
    propVar <- sampleDesign$getVarTotal(sampleDesign, prop)
    z <- z * sqrt(sampleDesign$weights)
    
    lambda1 <- sum(apply(z, 1, function(zi) return(t(zi) %*% sigma %*% zi)))
    lambda2 <- propVar / nPopulation
    bias <- (lambda1 - lambda2) / nPopulation
    
    return (bias)
  } #--


getVarianceRSampleBased <-
  function(prop,
           z,
           sigma,
           sampleDesign)
  { #++
    # Estimates the variance of the estimator for the R-indicator.
    
    weights <- sampleDesign$weights
    nSample <- length(weights)
    nPopulation <- sum(weights)
    
    propMean <- weighted.mean(prop, weights)
    propVar <- weightedVar(prop, weights, method = ''ML'')
    propZ <- cbind(prop, z)
    
    A <- cov.wt(propZ, wt = weights, method = ''ML'')$cov[-1, 1]
    B <- cov.wt(z, wt = weights, method = ''ML'')$cov
    C <- sampleDesign$getVarTotal(sampleDesign, (prop - propMean)^2)
    
    variance <- numeric()
    variance[1] <- 4 * t(A) %*% sigma %*% A
    variance[2] <- 2 * getTrace(B %*% sigma %*% B %*% sigma)
    variance[3] <- C / nPopulation^2
    variance <- sum(variance) / propVar
    
    return (variance)
  } #--

  getPartialRs <-
  function(indicator,
           sampleData,
           sampleDesign,
           otherVariables = character())
  { #++
    # Estimates both unconditional and conditional partial R-indicators.
    
    RR <- indicator$propMean
    modelVariables <- getVariables(indicator$model$formula, FALSE)
    variables <- unique(c(modelVariables, otherVariables))
    
    byVariablesR  <- NULL
    byVariablesCV  <- NULL
    byCategoriesR <- list()
    byCategoriesCV <- list()
    
    for (variable in variables) {
      pConditional <-
        getPartialRConditional(
          indicator, variable, sampleData, sampleDesign)
      
      pUnconditional <-
        getPartialRUnconditional(
          indicator, variable, sampleData, sampleDesign)
      
      byVariableR <- data.frame(
        variable   = variable,
        Pu         = pUnconditional$Pu,
        PuUnadj    = pUnconditional$PuUnadj,
        PuSE       = pUnconditional$PuSE,
        Pc         = pConditional$Pc,
        PcUnadj    = pConditional$PcUnadj,
        PcSEApprox = pUnconditional$PuSE)
      
      byVariableCV <- data.frame(
        variable   = variable,
        CVu         = pUnconditional$Pu/RR,
        CVuUnadj    = pUnconditional$PuUnadj/RR,
        CVuSE       = pUnconditional$PuSE/RR,
        CVc         = pConditional$Pc/RR,
        CVcUnadj    = pConditional$PcUnadj/RR,
        CVcSEApprox = pUnconditional$PuSE/RR)
      
      byVariablesR <- rbind(byVariablesR, byVariableR)
      byVariablesCV <- rbind(byVariablesCV, byVariableCV)
      
      byCategoryR <- merge(
        pUnconditional$byCategory,
        pConditional$byCategory)
      
      byCategoryCV <- byCategoryR
      names(byCategoryCV) <- c("category","CVuUnadj","CVuUnadjSE","CVcUnadj","CVcUnadjSE")
      byCategoryCV$CVuUnadj <- byCategoryCV$CVuUnadj/RR
      byCategoryCV$CVuUnadjSE <- byCategoryCV$CVuUnadjSE/RR
      byCategoryCV$CVcUnadj <- byCategoryCV$CVcUnadj/RR
      byCategoryCV$CVcUnadjSE <- byCategoryCV$CVcUnadjSE/RR
      
      byCategoriesR <- c(byCategoriesR, list(byCategoryR))
      byCategoriesCV <- c(byCategoriesCV, list(byCategoryCV))
    }
    
    names(byCategoriesR) <- byVariablesR$variable
    names(byCategoriesCV) <- byVariablesCV$variable
    
    partialR <- list(
      byVariables  = byVariablesR,
      byCategories = byCategoriesR)
    
    partialCV <- list(
      byVariables  = byVariablesCV,
      byCategories = byCategoriesCV)
    
    partials <- list(
      partialR  = partialR,
      partialCV = partialCV)
    
    return (partials)
  } #--


getPartialRUnconditional <-
  function(indicator,
           variable,
           sampleData,
           sampleDesign)
  { #++
    # Estimates unconditional partial R-indicators.
    
    stopifnot(variable %in% names(sampleData))
    
    categories  <- sampleData[[variable]]
    RBiasFactor <- indicator$RBiasFactor
    nPopulation <- sum(indicator$sampleDesign$weights)
    propMean    <- indicator$propMean          
    
    arg <- with(indicator,
                data.frame(
                  n    = sampleDesign$weights,
                  prop = sampleDesign$weights * prop))
    
    byCategory <- within(
      aggregate(arg, list(category = categories), sum), {
        prop     <- prop / n
        propSign <- sign(n * (prop - propMean))
        propVar  <- n * (prop - propMean)^2 / nPopulation
        PuUnadj  <- propSign * sqrt(propVar) })
    
    model <- within(indicator$model,
                    formula <- replaceRHSByVariable(formula, variable))
    
    propVar <- sum(byCategory$propVar)
    Pu      <- sqrt(propVar * RBiasFactor)
    PuUnadj <- sqrt(propVar)
    PuSE    <- 0.5 * getRSampleBased(model, sampleData, sampleDesign)$RSE
    
    partialIndicator <- list(
      type       = ''Unconditional partial R-indicator, sample based'',
      variable   = variable,
      Pu         = Pu,
      PuUnadj    = PuUnadj,
      PuSE       = PuSE,
      byCategory = byCategory)
    
    partialIndicator <- getVariancePartialRUnconditional(
      partialIndicator, indicator, sampleData, sampleDesign)
    
    partialIndicator$byCategory <-
      partialIndicator$byCategory[c(''category'', ''PuUnadj'', ''PuUnadjSE'')]
    
    return (partialIndicator)
  } #--

  
getVariancePartialRUnconditional <-
  function(partialIndicator,
           indicator,
           sampleData,
           sampleDesign)
  { #++
    # Calculate the variance of the partial-R indicators.
    
    nPopulation <- sum(sampleDesign$weights)
    variable    <- partialIndicator$variable
    byCategory  <- partialIndicator$byCategory
    prop        <- indicator$prop
    
    V1 <- numeric()
    V2 <- numeric()
    
    nSample <- nrow(sampleData)
    
    for (index in seq(nrow(byCategory))) {
      label  <- byCategory[index, ''category'']
      delta  <- ifelse(sampleData[[variable]] == label, 1, 0)
      deltaC <- 1 - delta
      
      V1[index] <- sampleDesign$getVarTotal(sampleDesign, delta * prop) 
      V2[index] <- sampleDesign$getVarTotal(sampleDesign, deltaC * prop)
    }
    
    partialIndicator$byCategory <- within(byCategory, {
      PuUnadjSE <- sqrt(n / nPopulation * (
        V1 * (1 / n - 1 / nPopulation)^2 +
          V2 * (1 / nPopulation)^2)) })
    
    return (partialIndicator)
  } #--


getPartialRConditional <-
  function(indicator,
           variable,
           sampleData,
           sampleDesign)
  { #++
    # Estimates conditional partial R-indicators.
    
    stopifnot(variable %in% names(sampleData))
    
    sampleWeights <- indicator$sampleDesign$weights
    modelVariables  <- getVariables(indicator$model$formula, FALSE)
    otherVariables  <- modelVariables %sub% variable
    otherCategories <- as.list(sampleData[otherVariables])
    
    propMeanByOthers <- with(indicator,
                             ave(sampleWeights * prop, otherCategories, FUN = sum) /
                               ave(sampleWeights, otherCategories, FUN = sum))
    
    zMeanByOthers <- apply(
      indicator$z, 2,
      FUN = function(x) return (
        ave(sampleWeights * x, otherCategories, FUN = sum) /
          ave(sampleWeights, otherCategories, FUN = sum)))
    
    categories  <- sampleData[[variable]]
    RBiasFactor <- indicator$RBiasFactor
    weights     <- sampleWeights / sum(sampleWeights)
    
    arg <- with(indicator,
                data.frame(
                  n       = sampleWeights,
                  propVar = weights * (prop - propMeanByOthers)^2))
    
    byCategory <- within(
      aggregate(arg, list(category = categories), sum), {
        PcUnadj <- sqrt(propVar) } )
    
    propVar <- sum(byCategory$propVar)
    Pc      <- sqrt(propVar * RBiasFactor)
    PcUnadj <- sqrt(propVar)
    
    partialIndicator <- list(
      type             = ''Conditional partial R-indicator, sample based'',
      variable         = variable,
      Pc               = Pc,
      PcUnadj          = PcUnadj,
      byCategory       = byCategory,
      propMeanByOthers = propMeanByOthers,
      zMeanByOthers    = zMeanByOthers)
    
    partialIndicator <- getVariancePartialRConditional(
      partialIndicator, indicator, sampleData, sampleDesign)
    
    partialIndicator$byCategory <-
      partialIndicator$byCategory[c(''category'', ''PcUnadj'', ''PcUnadjSE'')]
    
    return (partialIndicator)
  } #--

  
getVariancePartialRConditional <-
  function(partialIndicator,
           indicator,
           sampleData,
           sampleDesign)
  { #++
    byCategory  <- partialIndicator$byCategory
    variable    <- partialIndicator$variable
    sigma       <- indicator$sigma
    weights     <- sampleDesign$weights
    nPopulation <- sum(weights)
    
    propDelta <- indicator$prop - partialIndicator$propMeanByOthers
    zDelta <- indicator$z - partialIndicator$zMeanByOthers
    
    variance <- numeric()
    for (index in seq(nrow(byCategory))) {
      label <- byCategory[index, ''category'']
      delta <- ifelse(sampleData[[variable]] == label, 1, 0)
      zDeltaWeight <- zDelta * delta * weights
      propDelta2 <- propDelta * propDelta * delta
      
      A <- matrix(propDelta, nrow = 1) %*% zDeltaWeight
      B <- t(zDelta) %*% zDeltaWeight
      
      V1 <- 4 * A %*% sigma %*% t(A)
      V2 <- 2 * getTrace(B %*% sigma %*% B %*% sigma)
      V3 <- sampleDesign$getVarTotal(sampleDesign, propDelta2)
      
      variance[index] <-
        0.25 * (V1 + V2 + V3) /
        (nPopulation * sum(propDelta2 * weights))
    }
    
    partialIndicator$byCategory <- within(byCategory,
                                          PcUnadjSE <- sqrt(variance))
    
    return (partialIndicator)
  } #-

  
  getSampleStrata <-
  function(sampleWeights,
           nMaxStrata = 20)
  { #++
    # Guesses a definition of the sample strata, using the values of the sample
    # weights.
    
    weights <- sort(unique(sampleWeights))
    indices <- seq(along = sampleWeights)
    strata <- factor(seq(along = weights))
    
    if (length(weights) <= nMaxStrata) {
      values <- merge(
        data.frame(weight = sampleWeights, index = indices),
        data.frame(weight = weights, stratum  = strata),
        all.x = TRUE)
      
      sampleStrata <- values[order(values$index), ''stratum'']
    } else
      sampleStrata <- factor(rep(1, length(sampleWeights)))
    
    return (sampleStrata)
  } #--

  
getSampleDesign <-
  function(sampleWeights,
           sampleStrata)
  { #++
    # Guesses which type of sample desing is used, using the following rules.
    # (1) A single stratum and constant weights implies SI sampling.
    # (2) More than one stratum and constant weights per stratum implies STSI
    #     sampling.
    minmax <- sapply(split(sampleWeights, sampleStrata), range)
    constantWeights <- all(minmax[1,] == minmax[2,])
    
    nStrata <- length(levels(sampleStrata[, drop = TRUE]))
    
    if (constantWeights) {
      type <- ifelse(nStrata == 1, ''SI'', ''STSI'')
      getVarTotal <- getSampleVarTotalSTSI
      
    } else {
      type <- ''''
      getVarTotal <- getSampleVarTotalPPS
    }
    
    sampleDesign <- list(
      type        = type,
      weights     = sampleWeights,
      strata      = sampleStrata,
      getVarTotal = getVarTotal)
    
    return (sampleDesign)
  } #--

  
getSampleVarTotalSTSI <-
  function(sampleDesign,
           y)
  { #++
    # return (getSampleCovTotalSTSI(sampleDesign, y, y))
    
    getStratumVarTotal <-
      function(sample)
      { #++
        N <- sum(sample$weights)
        n <- nrow(sample)
        
        return (N^2 * (1 - n / N) * var(sample$y) / n)
      } #--
    
    sample <- data.frame(y = y, weights = sampleDesign$weights)
    strataVar <- sapply(split(sample, sampleDesign$strata), getStratumVarTotal)
    sampleVar <- sum(strataVar)
    
    return (sampleVar)
  } #--


getSampleVarTotalPPS <-
  function(sampleDesign,
           y)
  { #++
    # If the sample design is neither SI nor STSI, use the formulae of the SE
    # of a PPS design.
    
    # return (getSampleCovTotalPPS(sampleDesign, y, y))
    
    n <- length(sampleDesign$weights)
    y <- y * sampleDesign$weights
    sampleVar <- sum((n * y - sum(y))^2) / n / (n - 1)
    
    return (sampleVar)
  } #--

  
getVariables <-
  function(formula,
           leftHandSide = FALSE)
  { #++
    # Returns the names of the variables used either in the left hand side of
    # the formula or in the right hand side of the formula.
    
    if (leftHandSide)
      formula <- update.formula(formula, . ~ 1)
    else
      formula <- update.formula(formula, 1 ~ .)
    
    variables <- all.vars(formula)
    
    if (length(variables) == 1 && variables == .)
      variables <- NA
    
    return (variables)
  } #--


replaceRHSByVariable <-
  function(formula,
           variable)
  { #++
    replacement <- as.formula(paste(''. ~'' , variable, sep = ''''))
    formula <- update.formula(formula, replacement)
    
    return (formula)
  } #--


getTrace <-
  function(m)
  { #++
    # Returns the trace of the matrix m.
    
    return (sum(m[col(m) == row(m)]))
  } #--

  
weightedVar <-
  function(x,
           weights = rep(1, length(x)),
           method = c(''unbiased'',''ML''))
  { #++
    # Returns the weighted variance of the vector x.
    
    xMean <- weighted.mean(x, weights)
    xVar <- sum(weights * (x - xMean)^2)
    xVar <- switch(match.arg(method),
                   ''unbiased'' = xVar / (sum(weights) - 1),
                   ''ML''       = xVar / sum(weights))
    
    return (xVar)
  } #--

''%sub%'' <-
  function(x,
           y)
  { #++
    # Returns all elements of the set operation x - y.
    #     > c(1, 2, 3, 4, 5) %sub% c(2, 4)
    #     [1] 1 3 5
    
    return (x[! x %in% y])
  } #--

##############################################################################
# --------------------malli ja variaatiokertoimet--------------
##############################################################################

  # poistetaan ylimääräiset sarakkeet sekä rivit, jotka sisältävät malliin tulevien muuttujien NA-arvoja
  
  ## kielimuuttuja poistettu
  ## , "kielifisv"

  df <- df[, c("uusi", "tilastovuosi", "yo", "SES3", "mies", "alue")]	
  rowHasNA <- apply(df, 1, function(x){any(is.na(x))})
  df <- df[!rowHasNA, ]
  
  # luodaan liukuvasti n+1 vuoden jaksoille mallit ja lisätään jakso kerrallaan output-dataframeen variaatiokertoimet
 
  n <- 2										
  i <- min(df$tilastovuosi)
  max_tilv <- max(df$tilastovuosi)

  while (i + n <= max_tilv)
  {	  
	df3 <- df[which(df$tilastovuosi %in% i:(i+n)), ]
	n_vaste <- sum(subset(df3, yo == 1, uusi))

	## kielimuuttuja poistettu 
	## + kielifisv + SES3:kielifisv
	## , "kielifisv"
	  
	fit <- glm(yo ~ SES3 + mies + alue + SES3:mies,				
					family = "binomial", 
					data = df3[, c("yo", "SES3", "mies", "alue")]
				)								

	iLses3 <- getRIndicator(fit$formula, sampleData = df3, family = "binomial")

	  # valitut muuttujat, ei-ehdolliset

	  ses_koko_eiehd <- iLses3$partialCV$byVariables$CVu[[1]]					# SES3 koko
	  ses_alin_eiehd <- iLses3$partialCV$byCategories$SES3$CVuUnadj[[1]]		# matala-SES (1. kategoria)
	  ses_keski_eiehd <- iLses3$partialCV$byCategories$SES3$CVuUnadj[[2]]	  	# keski-SES (2. kategoria)
	  ses_yla_eiehd	<- iLses3$partialCV$byCategories$SES3$CVuUnadj[[3]] 		# korkea-SES (3. kategoria)

	  sp_koko_eiehd <- iLses3$partialCV$byVariables$CVu[[2]]					# sukupuoli koko
	  sp_nainen_eiehd <- iLses3$partialCV$byCategories$mies$CVuUnadj[[1]]		# nainen
	  sp_mies_eiehd <- iLses3$partialCV$byCategories$mies$CVuUnadj[[2]]			# mies

	  alue_koko_eiehd <- iLses3$partialCV$byVariables$CVu[[3]]					# alue koko
	  alue_1_eiehd <- iLses3$partialCV$byCategories$alue$CVuUnadj[[1]]			# maaseutumainen
	  alue_2_eiehd <- iLses3$partialCV$byCategories$alue$CVuUnadj[[2]]			# taajaan asuttu
	  alue_3_eiehd <- iLses3$partialCV$byCategories$alue$CVuUnadj[[3]]			# kaupunkimainen

	  ## kielimuuttuja poistettu
	  ## kieli_koko_eiehd <- iLses3$partialCV$byVariables$CVu[[4]] 					# kielifisv
	  ## kieli_fisv_eiehd <- iLses3$partialCV$byCategories$kielifisv$CVuUnadj[[1]]	# muu/tuntematon
	  ## kieli_muu_eiehd <- iLses3$partialCV$byCategories$kielifisv$CVuUnadj[[2]]	# suomi/saame/ruotsi


	  # valitut muuttujat, ehdolliset

	  ses_koko_ehd <- iLses3$partialCV$byVariables$CVc[[1]]						# SES3 koko
	  ses_alin_ehd <- iLses3$partialCV$byCategories$SES3$CVcUnadj[[1]]			# matala-SES (1. kategoria)
	  ses_keski_ehd <- iLses3$partialCV$byCategories$SES3$CVcUnadj[[2]]			# keski-SES (2. kategoria)
	  ses_yla_ehd	<- iLses3$partialCV$byCategories$SES3$CVcUnadj[[3]]			# korkea-SES (3. kategoria)

	  sp_koko_ehd <- iLses3$partialCV$byVariables$CVc[[2]]						# sukupuoli koko
	  sp_nainen_ehd <- iLses3$partialCV$byCategories$mies$CVcUnadj[[1]] 		# nainen
	  sp_mies_ehd <- iLses3$partialCV$byCategories$mies$CVcUnadj[[2]] 			# mies

	  alue_koko_ehd <- iLses3$partialCV$byVariables$CVc[[3]]					# alue koko
	  alue_1_ehd <- iLses3$partialCV$byCategories$alue$CVcUnadj[[1]]			# maaseutumainen
	  alue_2_ehd <- iLses3$partialCV$byCategories$alue$CVcUnadj[[2]]			# taajaan asuttu
	  alue_3_ehd <- iLses3$partialCV$byCategories$alue$CVcUnadj[[3]]			# kaupunkimainen

	  ## kielimuuttuja poistettu
	  ## kieli_koko_ehd <- iLses3$partialCV$byVariables$CVc[[4]] 					# kielifisv
	  ## kieli_fisv_ehd <- iLses3$partialCV$byCategories$kielifisv$CVcUnadj[[1]]	# muu/tuntematon
	  ## kieli_muu_ehd <- iLses3$partialCV$byCategories$kielifisv$CVcUnadj[[2]]		# suomi/saame/ruotsi

	# Lisätään lasketut arvot rivinä data frameen, joka lopuksi kirjoitetaan tauluun

	  ## kielimuuttuja poistettu
	  ## kieli_koko_eiehd, kieli_fisv_eiehd, kieli_muu_eiehd,
	  ## kieli_koko_ehd, kieli_fisv_ehd, kieli_muu_ehd

	if (i == min(df$tilastovuosi)) {
	  
		df_output <- data.frame("Tilastovuosi"				=	i+n,
								"Sektori"					=	sektori,
								"Koodit OKM ohjauksen ala"	=	vaste_ala_koodi,

								"n" = n_vaste,

								"SES"					=	ses_koko_eiehd, 
								"SES: 0-2"				=	ses_alin_eiehd, 
								"SES: 3-4"				=	ses_keski_eiehd, 
								"SES: 5-6"				=	ses_yla_eiehd,

								"Sukupuoli"				=	sp_koko_eiehd, 
								"Sukupuoli: nainen"		=	sp_nainen_eiehd, 
								"Sukupuoli: mies"		=	sp_mies_eiehd,
																		
								"Kuntaryhmä"					=	alue_koko_eiehd, 
								"Kuntaryhmä: maaseutumaiset"	=	alue_1_eiehd, 
								"Kuntaryhmä: taajaan asutut"	=	alue_2_eiehd, 
								"Kuntaryhmä: kaupunkimaiset"	=	alue_3_eiehd,
									
								"SES (vakioitu)"				=	ses_koko_ehd, 
								"SES: 0-2 (vakioitu)"			=	ses_alin_ehd, 
								"SES: 3-4 (vakioitu)"			=	ses_keski_ehd, 
								"SES: 5-6 (vakioitu)"			=	ses_yla_ehd,

								"Sukupuoli (vakioitu)"			=	sp_koko_ehd, 
								"Sukupuoli: nainen (vakioitu)"	=	sp_nainen_ehd, 
								"Sukupuoli: mies (vakioitu)"	=	sp_mies_ehd,
																		
								"Kuntaryhmä (vakioitu)"					=	alue_koko_ehd, 
								"Kuntaryhmä: maaseutumaiset (vakioitu)"	=	alue_1_ehd, 
								"Kuntaryhmä: taajaan asutut (vakioitu)"	=	alue_2_ehd, 
								"Kuntaryhmä: kaupunkimaiset (vakioitu)"	=	alue_3_ehd
								)
	
	} else {
		
		df_output <- rbind(df_output, data.frame("Tilastovuosi"				=	i+n,
												"Sektori"					=	sektori,
												"Koodit OKM ohjauksen ala"	=	vaste_ala_koodi,

												"n" = n_vaste,

												"SES"					=	ses_koko_eiehd, 
												"SES: 0-2"				=	ses_alin_eiehd, 
												"SES: 3-4"				=	ses_keski_eiehd, 
												"SES: 5-6"				=	ses_yla_eiehd,

												"Sukupuoli"				=	sp_koko_eiehd, 
												"Sukupuoli: nainen"		=	sp_nainen_eiehd, 
												"Sukupuoli: mies"		=	sp_mies_eiehd,
																		
												"Kuntaryhmä"					=	alue_koko_eiehd, 
												"Kuntaryhmä: maaseutumaiset"	=	alue_1_eiehd, 
												"Kuntaryhmä: taajaan asutut"	=	alue_2_eiehd, 
												"Kuntaryhmä: kaupunkimaiset"	=	alue_3_eiehd,
									
												"SES (vakioitu)"				=	ses_koko_ehd, 
												"SES: 0-2 (vakioitu)"			=	ses_alin_ehd, 
												"SES: 3-4 (vakioitu)"			=	ses_keski_ehd, 
												"SES: 5-6 (vakioitu)"			=	ses_yla_ehd,

												"Sukupuoli (vakioitu)"			=	sp_koko_ehd, 
												"Sukupuoli: nainen (vakioitu)"	=	sp_nainen_ehd, 
												"Sukupuoli: mies (vakioitu)"	=	sp_mies_ehd,
																		
												"Kuntaryhmä (vakioitu)"					=	alue_koko_ehd, 
												"Kuntaryhmä: maaseutumaiset (vakioitu)"	=	alue_1_ehd, 
												"Kuntaryhmä: taajaan asutut (vakioitu)"	=	alue_2_ehd, 
												"Kuntaryhmä: kaupunkimaiset (vakioitu)"	=	alue_3_ehd
												)
							)
		}

		i <- i + 1
  }

  OutputDataSet <- df_output

################################################################################################# 
  '
  ,@input_data_1 = N'
  SELECT 
  v.tilv
  ,v.sp
  ,v.sose_isa2
  ,v.sose_aiti2
  ,v.koulk_isa
  ,v.koulk_aiti
  ,v.tulo_isa
  ,v.tulo_aiti
  ,v.klaji
  ,v.uusi
  ,d1.kuntaryhma_koodi
  ,d2.OKM_ohjauksen_ala_koodi

  ,@ala_koodi as ''vaste_ala_koodi''
  ,@sektori as ''sektori''

  FROM [VipunenTK_SA].[dbo].[v_sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] v
  LEFT JOIN VipunenTK.dbo.d_alueluokitus d1 on d1.alueluokitus_avain = v.tilvaskunx
  LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d2 on d2.koulutusluokitus_avain = v.koulk
  
  WHERE 
  (
	@sektori = ''AMK'' AND v.klaji IN (''41'',''42'')
	OR @sektori = ''YO'' AND v.klaji = ''51'' 
	OR @sektori = ''YO/AMK'' AND v.klaji IN (''41'',''42'',''51'')
  )
  AND 
  (
	v.koulk_aiti <> ''999999''
	OR v.koulk_isa <> ''999999''
  )
  AND d1.kuntaryhma_koodi <> ''-1''
  AND v.uusi > 0
  AND 0+v.tilv - v.syntv BETWEEN 15 AND 29
  '
  ,@params = N'@ala_koodi nvarchar(20), @sektori nvarchar(20)'
  ,@ala_koodi = @ala_koodi
  ,@sektori = @sektori
 -- WITH RESULT SETS (([hello] int not null));

 








GO


USE [ANTERO]