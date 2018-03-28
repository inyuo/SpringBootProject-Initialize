package com.inyu.conf;

import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Created by jinyu on 2018/3/24/024.
 */
@Configuration
@EnableSwagger2
public class SwaggerConfiguration {

    public Docket buildDocket(){
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(buildApiInf())
                .select()
                //要扫描的api基础包 controller
                .apis(RequestHandlerSelectors.basePackage("com.inyu.controller"))
                .paths(PathSelectors.any())
                .build();
    }
    private ApiInfo buildApiInf(){
        return new ApiInfoBuilder()
                .title("INYU SpringBoot 使用Swagger2构建API文档")
                .contact(new Contact("jino","https://github.com/q669239799","q669239799@163.com"))
                .version("1.0")
                .build();
    }
}
