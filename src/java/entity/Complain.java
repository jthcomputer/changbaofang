package entity;

public class Complain {
    private Integer complainid;
    private Integer complainhotelid;
    private String complainuserid;
    private String complaintitle;
    private String complaincontent;
    private String complainreply;
    private String complainstatus;

    public int getComplainid() {
        return complainid;
    }

    public void setComplainid(int complainid) {
        this.complainid = complainid;
    }

    public int getComplainhotelid() {
        return complainhotelid;
    }

    public void setComplainhotelid(int complainhotelid) {
        this.complainhotelid = complainhotelid;
    }

    public String getComplainuserid() {
        return complainuserid;
    }

    public void setComplainuserid(String complainuserid) {
        this.complainuserid = complainuserid;
    }

    public String getComplaintitle() {
        return complaintitle;
    }

    public void setComplaintitle(String complaintitle) {
        this.complaintitle = complaintitle;
    }

    public String getComplaincontent() {
        return complaincontent;
    }

    public void setComplaincontent(String complaincontent) {
        this.complaincontent = complaincontent;
    }

    public String getComplainreply() {
        return complainreply;
    }

    public void setComplainreply(String complainreply) {
        this.complainreply = complainreply;
    }

    public String getComplainstatus() {
        return complainstatus;
    }

    public void setComplainstatus(String complainstatus) {
        this.complainstatus = complainstatus;
    }
}
