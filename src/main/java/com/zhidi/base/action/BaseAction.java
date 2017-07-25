package com.zhidi.base.action;

import com.opensymphony.xwork2.ActionSupport;
import com.zhidi.util.Pager;
import com.zhidi.util.ResultData;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lx on 2017/7/24.
 */
public class BaseAction extends ActionSupport {

    protected Pager pager;
    protected ResultData resultData;

    public Pager getPager() {
        return pager;
    }

    public void setPager(Pager pager) {
        this.pager = pager;
    }

    public ResultData getResultData() {
        return resultData;
    }

    public void setResultData(ResultData resultData) {
        this.resultData = resultData;
    }

    /**
     * 把对象转换为json格式并且输出至客户端
     * @param obj
     * @throws IOException
     */
    protected void printJSONObject(Object obj) throws IOException{
        printJSONObject(obj, new String[]{});
    }

    /**
     * 将对象转换为json格式并且输出至客户端
     * @param obj
     * @param excludeProperties -将会被配置属性
     * @throws IOException
     */
    protected void printJSONObject(Object obj, String... excludeProperties) throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        PrintWriter out = response.getWriter();

        JsonConfig config = new JsonConfig();
        config.setExcludes(excludeProperties);

        JSONObject json = JSONObject.fromObject(obj, config);

        out.print(json.toString());
        out.flush();
    }

    protected HttpSession getSession(){
        return ServletActionContext.getRequest().getSession();
    }
}
