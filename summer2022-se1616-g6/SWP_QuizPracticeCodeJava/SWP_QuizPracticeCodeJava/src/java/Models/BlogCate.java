
package Models;

public class BlogCate {
    private int blogCateId;
    private String cateName;

    public BlogCate() {}
    
    public BlogCate(int blogCateId, String cateName) {
        this.blogCateId = blogCateId;
        this.cateName = cateName;
    }

    public int getBlogCateId() {
        return blogCateId;
    }

    public void setBlogCateId(int blogCateId) {
        this.blogCateId = blogCateId;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    @Override
    public String toString() {
        return "BlogCate{" + "blogCateId=" + blogCateId + ", cateName=" + cateName + '}';
    }
    
}
