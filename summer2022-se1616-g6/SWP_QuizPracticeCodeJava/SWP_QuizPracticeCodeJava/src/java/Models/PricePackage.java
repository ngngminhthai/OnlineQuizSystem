package Models;

public class PricePackage {

    private int packageId;
    private String packageName;
    private double listPrice;
    private double salePrice;
    private boolean status;
    private int duration;
    private int subjectId;

    public PricePackage() {
    }

    public PricePackage(int packageId, String packageName, double listPrice, double salePrice, boolean status, int subjectId, int duration) {
        this.packageId = packageId;
        this.packageName = packageName;
        this.listPrice = listPrice;
        this.salePrice = salePrice;
        this.status = status;
        this.duration = duration;
        this.subjectId = subjectId;
    }

    public PricePackage(double listPrice, double salePrice, int duration) {
        this.listPrice = listPrice;
        this.salePrice = salePrice;
        this.duration = duration;
    }

    public int getPackageId() {
        return packageId;
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public double getListPrice() {
        return listPrice;
    }

    public void setListPrice(double listPrice) {
        this.listPrice = listPrice;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    @Override
    public String toString() {
        return "PricePackage{" + "packageId=" + packageId + ", packageName=" + packageName + ", listPrice=" + listPrice + ", salePrice=" + salePrice + ", status=" + status + ", duration=" + duration + ", subjectId=" + subjectId + '}';
    }
    
}
