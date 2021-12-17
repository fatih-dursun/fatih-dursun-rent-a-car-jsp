/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beanPack;

/**
 *
 * @author lenova
 */
import java.io.Serializable;

public class Page implements Serializable {

    private String title;
    private String url;
    private String content;

    public Page() {
        title = "";
        url = "";
        content = "";
    }

    public Page(String title, String content, String url) {
        this.title = title;
        this.url = url;
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
