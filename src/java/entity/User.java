package entity;

public class User {
    public String userid;
    public String username;
    public String password;
    public String usertype;        //类型：0：管理员  1:用户
    public int userintergral;   //积分
    public String userphone;       //联系方式
    public String useridcard;      //身份证照片

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getpassword() {
        return password;
    }

    public void setpassword(String password) {
        this.password = password;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public int getUserintergral() {
        return userintergral;
    }

    public void setUserintergral(int userintergral) {
        this.userintergral = userintergral;
    }

    public String getUserphone() {
        return userphone;
    }

    public void setUserphone(String userphone) {
        this.userphone = userphone;
    }

    public String getUseridcard() {
        return useridcard;
    }

    public void setUseridcard(String useridcard) {
        this.useridcard = useridcard;
    }
}
