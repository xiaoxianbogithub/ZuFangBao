package com.ruoyi.common.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.utils.file.FileUtils;

import java.io.Serializable;

/**
 * @Author :VeeoTech.xiao
 * @Date : 1/11/2023 10:07
 */
public class AjaxFile implements Serializable {

    private String url;
    private String fileName;
    private String newFileName;
    private String originalFilename;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getNewFileName() {
        return newFileName;
    }

    public void setNewFileName(String newFileName) {
        this.newFileName = newFileName;
    }

    public String getOriginalFilename() {
        return originalFilename;
    }

    public void setOriginalFilename(String originalFilename) {
        this.originalFilename = originalFilename;
    }

    @Override
    public String toString() {
        return "AjaxFile{" +
                "url='" + url + '\'' +
                ", fileName='" + fileName + '\'' +
                ", newFileName='" + newFileName + '\'' +
                ", originalFilename='" + originalFilename + '\'' +
                '}';
    }
}
