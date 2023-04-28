package fi.csc.antero.controller;

import io.swagger.annotations.ApiParam;

public class ApiQuery {

    @ApiParam(value = "FIQL query filter. Example: prop1=='text*' and prop2>3")
    private String filter;
    @ApiParam(value = "Sorting '+' asc and '-' desc. Example: (+prop1,-prop2)")
    private String sort;
    @ApiParam(value = "Offset of returned results")
    private Long offset;
    @ApiParam(value = "Number of returned results")
    private Long limit;

    public String getFilter() {
        return filter;
    }

    public void setFilter(String filter) {
        this.filter = filter;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Long getOffset() {
        return offset;
    }

    public void setOffset(Long offset) {
        this.offset = offset;
    }

    public Long getLimit() {
        return limit;
    }

    public void setLimit(Long limit) {
        this.limit = limit;
    }

    @Override
    public String toString() {
        return "filter='" + filter + '\'' +
                ";sort='" + sort + '\'' +
                ";offset=" + offset +
                ";limit=" + limit;
    }
}
