package fi.csc.antero.util;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.text.WordUtils;

public class Utils {

    public static String convertToCamelCase(String s) {
        final String capitalizeFully = WordUtils.capitalizeFully(s,  '_', ' ')
            .replaceAll("\\s", "").replaceAll("_", "");
        return StringUtils.uncapitalize(capitalizeFully);
    }
}
