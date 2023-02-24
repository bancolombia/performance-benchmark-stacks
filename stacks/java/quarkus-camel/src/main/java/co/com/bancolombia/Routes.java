package co.com.bancolombia;

import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.rest.RestBindingMode;

public class Routes extends RouteBuilder {

    @Override
    public void configure() {

        restConfiguration().bindingMode(RestBindingMode.json);

        rest("/status")
                .get()
                .to("direct:getStatus");


        from("direct:getStatus")
                .setBody().constant(new Status("UP"));
    }
}
