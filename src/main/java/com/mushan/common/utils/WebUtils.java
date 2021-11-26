package com.mushan.common.utils;

import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

public class WebUtils {
    public static <T> T copyJavaBean(Map map, T bean) {
        try {
            BeanUtils.populate(bean, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return bean;
    }
    public static Integer strToInteger(String str, int defaultNum) {
        if (str != null) {
            try {
                return Integer.parseInt(str);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        return defaultNum;
    }
}
