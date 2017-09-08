/**
 *
 */
package com.thinkgem.jeesite.modules.sys.interceptor;

/**
 * @author Zeus
 * @2016-12-14
 */

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Token {

    boolean save() default false;

    boolean remove() default false;

    int saveNum() default 0;

    int removeNum() default 0;
}