package co.com.bancolombia;

import co.com.bancolombia.models.LoopStatus;
import co.com.bancolombia.utils.Crypt;
import co.com.bancolombia.utils.DelayedTask;
import co.com.bancolombia.utils.DelayedTaskRunner;
import co.com.bancolombia.utils.Hash;
import co.com.bancolombia.utils.Prime;
import lombok.SneakyThrows;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.rest.ParamDefinition;
import org.apache.camel.model.rest.RestBindingMode;
import org.apache.camel.model.rest.RestParamType;

import java.util.UUID;

public class Routes extends RouteBuilder {

    @Override
    public void configure() {

        restConfiguration().bindingMode(RestBindingMode.json);

        rest("/status")
                .get()
                .to("direct:getStatus");

        rest("/hash")
                .get()
                .param(new ParamDefinition().name("percentage").type(RestParamType.query).defaultValue("100"))
                .param(new ParamDefinition().name("delay").type(RestParamType.query).defaultValue("0"))
                .to("direct:getHash");

        rest("/crypt")
                .get()
                .param(new ParamDefinition().name("percentage").type(RestParamType.query).defaultValue("100"))
                .param(new ParamDefinition().name("delay").type(RestParamType.query).defaultValue("0"))
                .to("direct:getCrypt");

        rest("/prime/{top}")
                .get()
                .param(new ParamDefinition().name("percentage").type(RestParamType.query).defaultValue("100"))
                .param(new ParamDefinition().name("delay").type(RestParamType.query).defaultValue("0"))
                .param(new ParamDefinition().name("top").type(RestParamType.path))
                .to("direct:getPrime");


        from("direct:getStatus")
                .setBody().constant(new Status("UP"));

        from("direct:getHash")
                .setBody(x -> getHash(x.getIn().getHeader("percentage", Integer.class),
                        x.getIn().getHeader("delay", Integer.class)));

        from("direct:getCrypt")
                .setBody(x -> getCrypt(x.getIn().getHeader("percentage", Integer.class),
                        x.getIn().getHeader("delay", Integer.class)));

        from("direct:getPrime")
                .setBody(x -> getPrime(x.getIn().getHeader("top", Integer.class),
                        x.getIn().getHeader("percentage", Integer.class),
                        x.getIn().getHeader("delay", Integer.class)));
    }

    @SneakyThrows
    private LoopStatus getHash(int percentage, int delay) {
        Hash hash = new Hash();
        DelayedTask service = () -> hash.sha256(UUID.randomUUID().toString());
        int times = DelayedTaskRunner.start(service, percentage, delay);
        return LoopStatus.builder().status("OK").applied(times > 0).times(times).build();
    }

    @SneakyThrows
    private LoopStatus getCrypt(int percentage, int delay) {
        Crypt crypt = new Crypt();
        DelayedTask service = () -> {
            String clear = UUID.randomUUID().toString();
            String encrypted = crypt.bcrypt(clear);
            return crypt.validate(clear, encrypted);
        };
        int times = DelayedTaskRunner.start(service, percentage, delay);
        return LoopStatus.builder().status("OK").applied(times > 0).times(times).build();
    }

    @SneakyThrows
    private LoopStatus getPrime(int top, int percentage, int delay) {
        Prime prime = new Prime();
        DelayedTask service = () -> prime.primo(top);
        int times = DelayedTaskRunner.start(service, percentage, delay);
        return LoopStatus.builder().status("OK").applied(times > 0).times(times).build();
    }
}
