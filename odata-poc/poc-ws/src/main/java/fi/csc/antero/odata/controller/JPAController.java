package fi.csc.antero.odata.controller;

import com.sdl.odata.controller.AbstractODataController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * The default entry-point for the OData-poc
 *
 * @author aki.heikkinen@arcusys.fi
 */
@RestController
@RequestMapping("/odata-poc.svc/**")
public class JPAController extends AbstractODataController {}
