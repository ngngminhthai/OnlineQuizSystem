
package Models;

public class Category {
    private int catId;
    private String catName;
    private int subjectQuantity;
    
    public Category() {}

    public Category(int catId, String catName) {
        this.catId = catId;
        this.catName = catName;
    }

    public Category(int catId, String catName, int subjectQuantity) {
        this.catId = catId;
        this.catName = catName;
        this.subjectQuantity = subjectQuantity;
    }

    public int getSubjectQuantity() {
        return subjectQuantity;
    }

    public void setSubjectQuantity(int subjectQuantity) {
        this.subjectQuantity = subjectQuantity;
    }
    
    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    @Override
    public String toString() {
        return "Category{" + "catId=" + catId + ", catName=" + catName + ", subjectQuantity=" + subjectQuantity + '}';
    }

    
    
}
