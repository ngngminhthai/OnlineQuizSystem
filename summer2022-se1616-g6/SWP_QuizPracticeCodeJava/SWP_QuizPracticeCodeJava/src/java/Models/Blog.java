
package Models;

import java.sql.Date;

public class Blog {
    private int blogId;
    private String blogTitle;
    private BlogCate blogCate;
    private String thumbnail;
    private Date lastUpdated;
    private User author;
    private String briefInfo; 
    private String blogDetail;
    private boolean blogStatus;
    
    private int blogCategoryId;
    private int authorid;
    private String cateName;
    private String authorName;
    public Blog() {}

    public Blog(int blogId, String blogTitle, String thumbnail, Date lastUpdated, String briefInfo, String blogDetail, BlogCate blogCate, User author) {
        this.blogId = blogId;
        this.blogTitle = blogTitle;
        this.blogCate = blogCate;
        this.thumbnail = thumbnail;
        this.lastUpdated = lastUpdated;
        this.author = author;
        this.briefInfo = briefInfo;
        this.blogDetail = blogDetail;
    }

    public Blog(int blogId, String blogTitle, String authorName) {
        this.blogId = blogId;
        this.blogTitle = blogTitle;
        this.authorName = authorName;
    }
    
    public Blog(int blogCategoryId, String cateName) {
        this.blogCategoryId = blogCategoryId;
        this.cateName = cateName;
    }
    
    public Blog(int blogId, String blogTitle, int blogCategoryId, String thumbnail, Date lastUpdated, int author, String briefInfo, String blogDetail) {
        this.blogId = blogId;
        this.blogTitle = blogTitle;
        this.blogCategoryId = blogCategoryId;
        this.thumbnail = thumbnail;
        this.lastUpdated = lastUpdated;
        this.authorid = author;
        this.briefInfo = briefInfo;
        this.blogDetail = blogDetail;
    }

    public Blog(int blogId, String blogTitle, int blogCategoryId, String thumbnail, Date lastUpdated, int author, String briefInfo, String blogDetail, boolean blogStatus) {
        this.blogId = blogId;
        this.blogTitle = blogTitle;
        this.blogCategoryId = blogCategoryId;
        this.thumbnail = thumbnail;
        this.lastUpdated = lastUpdated;
        this.authorid = author;
        this.briefInfo = briefInfo;
        this.blogDetail = blogDetail;
        this.blogStatus = blogStatus;
    }

    public Blog(String blogTitle, int blogCategoryId, String thumbnail, Date lastUpdated, int author, String briefInfo, String blogDetail, boolean blogStatus) {
        this.blogTitle = blogTitle;
        this.blogCategoryId = blogCategoryId;
        this.thumbnail = thumbnail;
        this.lastUpdated = lastUpdated;
        this.authorid = author;
        this.briefInfo = briefInfo;
        this.blogDetail = blogDetail;
        this.blogStatus = blogStatus;
    }
    
    public boolean getBlogStatus() {
        return blogStatus;
    }

    public void setBlogStatus(boolean blogStatus) {
        this.blogStatus = blogStatus;
    }
    
    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public BlogCate getBlogCategory() {
        return blogCate;
    }

    public void setBlogCategory(BlogCate blogCategory) {
        this.blogCate = blogCategory;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getBriefInfo() {
        return briefInfo;
    }

    public void setBriefInfo(String briefInfo) {
        this.briefInfo = briefInfo;
    }

    public String getBlogDetail() {
        return blogDetail;
    }

    public void setBlogDetail(String blogDetail) {
        this.blogDetail = blogDetail;
    }

    @Override
    public String toString() {
        return "Blog{" + "blogId=" + blogId + ", blogTitle=" + blogTitle + ", blogCategory=" + blogCate + ", thumbnail=" + thumbnail + ", lastUpdated=" + lastUpdated + ", author=" + author + ", briefInfo=" + briefInfo + ", blogDetail=" + blogDetail + '}';
    }

    public BlogCate getBlogCate() {
        return blogCate;
    }

    public void setBlogCate(BlogCate blogCate) {
        this.blogCate = blogCate;
    }

    public int getBlogCategoryId() {
        return blogCategoryId;
    }

    public void setBlogCategoryId(int blogCategoryId) {
        this.blogCategoryId = blogCategoryId;
    }

    public int getAuthorid() {
        return authorid;
    }

    public void setAuthorid(int authorid) {
        this.authorid = authorid;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }
    
    public String getCateName(int cateId) {
        switch(cateId){
            case 1:
                cateName = "Life style";
                break;
            case 2:
                cateName = "Fitness";
                break;
            case 3:
                cateName = "Fashion";
                break;
            case 4:
                cateName = "Social media";
                break;
            case 5:
                cateName = "Food";
                break;
        }
        return cateName;
    }

}
