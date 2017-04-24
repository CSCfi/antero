package fi.csc.antero.repository;

public enum PathType {
    NUMBER("number"),
    STRING("string"),
    BOOLEAN("boolean"),
    DATE("date", "yyyy-MM-dd"),
    TIME("date", "HH:mm:ss"),
    DATETIME("date", "yyyy-MM-dd HH:mm:ss");

    private String format;
    private String name;

    PathType(String name, String format) {
        this.format = format;
        this.name = name;
    }

    PathType(String name) {
        this.name = name;
    }

    public String getFormat() {
        return format;
    }

    public String getName() {
        return name;
    }
}
