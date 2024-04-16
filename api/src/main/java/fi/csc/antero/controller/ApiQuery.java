package fi.csc.antero.controller;

import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.Explode;

public class ApiQuery {

    @Parameter(explode = Explode.TRUE, description = "FIQL query filter. Example: prop1=='text*' and prop2>3")
    private String filter;
    @Parameter(explode = Explode.TRUE, description = "Sorting '+' asc and '-' desc. Example: (+prop1,-prop2)")
    private String sort;
    @Parameter(explode = Explode.TRUE, description = "Offset of returned results", example = "0")
    private Long offset;
    @Parameter(explode = Explode.TRUE, description = "Number of returned results", example = "5")
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
}
