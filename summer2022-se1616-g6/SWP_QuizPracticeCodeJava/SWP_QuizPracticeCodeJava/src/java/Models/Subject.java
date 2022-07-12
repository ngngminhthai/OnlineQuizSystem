package Models;

import java.sql.Date;
import java.util.ArrayList;

public class Subject {
    
    private int subjectId;
    private String subjectName;
    private String description;
    private String thumbnailURL;
    private boolean featured;
    private boolean status;
    private Date updatedDate;
    private Category cat;
    private PricePackage pricePack;
    private int expertId;
    private String expertName;
    ArrayList<FeedBack> feedBack;
     ArrayList<Tag> tag;
     
    public ArrayList<FeedBack> getFeedBack() {
        return feedBack;
    }

    public void setFeedBack(ArrayList<FeedBack> feedBack) {
        this.feedBack = feedBack;
    }

    public ArrayList<Tag> getTag() {
        return tag;
    }

    public void setTag(ArrayList<Tag> tag) {
        this.tag = tag;
    }
    ArrayList<Expert> expert;
    ArrayList<Lesson> lesson;
    int totalLesson;
    ArrayList<PricePackage> pricePackage;
    Category category;
    
    private Dimension dimensionId;

    public Subject() {
    }

    public ArrayList<Expert> getExpert() {
        return expert;
    }

    public void setExpert(ArrayList<Expert> expert) {
        this.expert = expert;
    }

    public ArrayList<Lesson> getLesson() {
        return lesson;
    }

    public void setLesson(ArrayList<Lesson> lesson) {
        this.lesson = lesson;
    }

    public int getExpertId() {
        return expertId;
    }

    public void setExpertId(int expertId) {
        this.expertId = expertId;
    }

    public int getTotalLesson() {
        return totalLesson;
    }

    public void setTotalLesson(int totalLesson) {
        this.totalLesson = totalLesson;
    }

    public ArrayList<PricePackage> getPricePackage() {
        return pricePackage;
    }

    public void setPricePackage(ArrayList<PricePackage> pricePackage) {
        this.pricePackage = pricePackage;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public PricePackage getPricePack() {
        return pricePack;
    }

    public void setPricePack(PricePackage pricePack) {
        this.pricePack = pricePack;
    }

    public String getExpertName() {
        return expertName;
    }

    public void setExpertName(String expertName) {
        this.expertName = expertName;
    }

    public Dimension getDimensionId() {
        return dimensionId;
    }

    public void setDimensionId(Dimension dimensionId) {
        this.dimensionId = dimensionId;
    }

    public Subject(int subjectId, String subjectName) {
        this.subjectId = subjectId;
        this.subjectName = subjectName;
    }
    
    public Subject(int subjectId, String subjectName, String expertName) {
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.expertName = expertName;
    }
    
    public Subject(int subjectId, String subjectName, Category cat, int expertId, String expertName, boolean status, int totalLesson) {
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.status = status;
        this.cat = cat;
        this.expertId = expertId;
        this.expertName = expertName;
        this.totalLesson = totalLesson;
    }
    
    public Subject(int subjectId, String subjectName, String description, String thumbnailURL, boolean featured, boolean status, Date updatedDate, Category cat, int expertId, String expertName) {
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.description = description;
        this.thumbnailURL = thumbnailURL;
        this.featured = featured;
        this.status = status;
        this.updatedDate = updatedDate;
        this.cat = cat;
        this.expertId = expertId;
        this.expertName = expertName;
    }
    
    
    public Subject(int subjectId, String subjectName, String description, String thumbnailURL, boolean featured, boolean status, Date updatedDate, PricePackage pricePack) {
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.description = description;
        this.thumbnailURL = thumbnailURL;
        this.featured = featured;
        this.status = status;
        this.updatedDate = updatedDate;
        this.pricePack = pricePack;
    }

    public Subject(int subjectId, String subjectName, String description, String thumbnailURL, boolean featured, boolean status, Date updatedDate, Category cat) {
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.description = description;
        this.thumbnailURL = thumbnailURL;
        this.featured = featured;
        this.status = status;
        this.updatedDate = updatedDate;
        this.cat = cat;
    }

    public Subject(String subjectName) {
        this.subjectName = subjectName;
    }

    public Subject(int subjectId, String subjectName, String description, String thumbnailURL, boolean featured, boolean status, Date updatedDate) {
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.description = description;
        this.thumbnailURL = thumbnailURL;
        this.featured = featured;
        this.status = status;
        this.updatedDate = updatedDate;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbnailURL() {
        return thumbnailURL;
    }

    public void setThumbnailURL(String thumbnailURL) {
        this.thumbnailURL = thumbnailURL;
    }

    public boolean isFeatured() {
        return featured;
    }

    public void setFeatured(boolean featured) {
        this.featured = featured;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public Category getCat() {
        return cat;
    }

    public void setCat(Category cat) {
        this.cat = cat;
    }

//    @Override
//    public String toString() {
//        return "Subject{" + "subjectId=" + subjectId + ", subjectName=" + subjectName + ", description=" + description + ", thumbnailURL=" + thumbnailURL + ", featured=" + featured + ", status=" + status + ", updatedDate=" + updatedDate + ", cat=" + cat + '}';
//    }

    @Override
    public String toString() {
        return "Subject{" + "subjectId=" + subjectId + ", subjectName=" + subjectName + ", description=" + description + ", thumbnailURL=" + thumbnailURL + ", featured=" + featured + ", status=" + status + ", updatedDate=" + updatedDate + ", cat=" + cat + ", pricePack=" + pricePack + ", expertId=" + expertId + ", expertName=" + expertName + ", feedBack=" + feedBack + ", tag=" + tag + ", expert=" + expert + ", lesson=" + lesson + ", totalLesson=" + totalLesson + ", pricePackage=" + pricePackage + ", category=" + category + ", dimensionId=" + dimensionId + '}';
    }

}
