package com.yzframework.model;

import com.yzframework.base.Model;
import java.io.Serializable;
import java.sql.Timestamp;
/**
 * 用户角色管理
 * @author yuzhuo
 */
public class Tuserrole extends Model implements Serializable {

    private static final long serialVersionUID = -1L;

    public Tuserrole(){}

    /// 自定义区域 开始
    private String rolename;
    
    public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
    /// 自定义区域 结束

    /// 工具生成区域 开始
    private String userid;
    public String getUserid() {
        return userid;
    }
    public void setUserid(String userid) {
        this.firePropertyChange("userid");
        this.userid = userid;
    }

    private String roleid;
    public String getRoleid() {
        return roleid;
    }
    public void setRoleid(String roleid) {
        this.firePropertyChange("roleid");
        this.roleid = roleid;
    }

    private String status;
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.firePropertyChange("status");
        this.status = status;
    }

    private String createid;
    public String getCreateid() {
        return createid;
    }
    public void setCreateid(String createid) {
        this.firePropertyChange("createid");
        this.createid = createid;
    }

    private Timestamp createtime;
    public Timestamp getCreatetime() {
        return createtime;
    }
    public void setCreatetime(Timestamp createtime) {
        this.firePropertyChange("createtime");
        this.createtime = createtime;
    }

    private String updateid;
    public String getUpdateid() {
        return updateid;
    }
    public void setUpdateid(String updateid) {
        this.firePropertyChange("updateid");
        this.updateid = updateid;
    }

    private Timestamp updatetime;
    public Timestamp getUpdatetime() {
        return updatetime;
    }
    public void setUpdatetime(Timestamp updatetime) {
        this.firePropertyChange("updatetime");
        this.updatetime = updatetime;
    }
}