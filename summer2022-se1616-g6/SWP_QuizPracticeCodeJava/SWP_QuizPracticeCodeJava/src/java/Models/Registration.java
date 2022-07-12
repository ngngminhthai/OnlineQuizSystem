
package Models;

import java.sql.Date;
import java.util.ArrayList;

public class Registration {
    private int regId;
    private String email;
    private Date regTime;
    private String subject;
    private String pack;
    private float totalCost;
    private Date validFrom;
    private Date validTo;
    private String lastUpdateBy;
    private String note;
    private boolean status;
    private boolean isAccepted;
    private Subject sub;
    private PricePackage pricepackage;
    

    public Subject getSub() {
        return sub;
    }

    public void setSub(Subject sub) {
        this.sub = sub;
    }

    public PricePackage getPricepackage() {
        return pricepackage;
    }

    public void setPricepackage(PricePackage pricepackage) {
        this.pricepackage = pricepackage;
    }



    

    public boolean isIsAccepted() {
        return isAccepted;
    }

    public void setIsAccepted(boolean isAccepted) {
        this.isAccepted = isAccepted;
    }
    

    public Registration() {}

    public Registration(String subject) {
        this.subject = subject;
    }

    public Registration(int regId, String email, Date regTime, String subject, String pack, float totalCost, Date validFrom, Date validTo, String lastUpdateBy, String note, boolean status) {
        this.regId = regId;
        this.email = email;
        this.regTime = regTime;
        this.subject = subject;
        this.pack = pack;
        this.totalCost = totalCost;
        this.validFrom = validFrom;
        this.validTo = validTo;
        this.lastUpdateBy = lastUpdateBy;
        this.note = note;
        this.status = status;
    }

    public Registration(int regId, String email, Date regTime, String subject, String pack, float totalCost, Date validFrom, Date validTo, String lastUpdateBy, boolean status) {
        this.regId = regId;
        this.email = email;
        this.regTime = regTime;
        this.subject = subject;
        this.pack = pack;
        this.totalCost = totalCost;
        this.validFrom = validFrom;
        this.validTo = validTo;
        this.lastUpdateBy = lastUpdateBy;
        this.status = status;
    }

    public int getRegId() {
        return regId;
    }

    public void setRegId(int regId) {
        this.regId = regId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getRegTime() {
        return regTime;
    }

    public void setRegTime(Date regTime) {
        this.regTime = regTime;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getPack() {
        return pack;
    }

    public void setPack(String pack) {
        this.pack = pack;
    }

    public float getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(float totalCost) {
        this.totalCost = totalCost;
    }

    public Date getValidFrom() {
        return validFrom;
    }

    public void setValidFrom(Date validFrom) {
        this.validFrom = validFrom;
    }

    public Date getValidTo() {
        return validTo;
    }

    public void setValidTo(Date validTo) {
        this.validTo = validTo;
    }

    public String getLastUpdateBy() {
        return lastUpdateBy;
    }

    public void setLastUpdateBy(String lastUpdateBy) {
        this.lastUpdateBy = lastUpdateBy;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Registration{" + "regId=" + regId + ", email=" + email + ", regTime=" + regTime + ", subject=" + subject + ", pack=" + pack + ", totalCost=" + totalCost + ", validFrom=" + validFrom + ", validTo=" + validTo + ", lastUpdateBy=" + lastUpdateBy + ", note=" + note + ", status=" + status + '}';
    }

    
}
