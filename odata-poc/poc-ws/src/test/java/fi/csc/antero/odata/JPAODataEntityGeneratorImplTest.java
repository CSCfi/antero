package fi.csc.antero.odata;

import com.sdl.odata.api.edm.ODataEdmException;
import com.sdl.odata.api.processor.datasource.ODataDataSourceException;
import com.sdl.odata.datasource.jpa.JPAODataEntityGeneratorImpl;
import com.sdl.odata.edm.factory.annotations.AnnotationEntityDataModelFactory;
import fi.csc.antero.odata.model.F_Maara;
import fi.csc.antero.odata.model.SA_Aipal;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * @author aki.heikkinen@arcusys.fi
 */
public class JPAODataEntityGeneratorImplTest {
    private static final Logger _log = LoggerFactory.getLogger(JPAODataEntityGeneratorImplTest.class);

    private static final List<Class<?>> entities = new ArrayList<Class<?>>() { {
        add(F_Maara.class);
        add(SA_Aipal.class);
    } };

    @Test
    public void testGenerateODataEntities() throws ODataDataSourceException, ODataEdmException {
        final JPAODataEntityGeneratorImpl generator = new JPAODataEntityGeneratorImpl();
        generator.setOdataNamespace("Sdl.ContentDelivery");

        final List<Class<?>> odataClasses = generator.generateODataEntityClasses(entities);
        final AnnotationEntityDataModelFactory factory = new AnnotationEntityDataModelFactory();
        odataClasses.forEach(factory::addClass);

        _log.info("Building EntityDataModel");
        factory.buildEntityDataModel();
    }
}
