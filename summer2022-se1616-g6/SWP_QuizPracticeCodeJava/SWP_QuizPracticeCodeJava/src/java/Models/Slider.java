
package Models;

public class Slider {
    private int sliderId;
    private String sliderTitle;
    private String image;
    private int backlink;
    private String note;
    private boolean status;
    
    private String subjectName;

    public Slider() {}

    public Slider(int sliderId, String sliderTitle, String image, int link, String note, boolean status) {
        this.sliderId = sliderId;
        this.sliderTitle = sliderTitle;
        this.image = image;
        this.backlink = link;
        this.note = note;
        this.status = status;
    }

    public Slider(int sliderId, String sliderTitle, String image, int backlink, String note, boolean status, String subjectName) {
        this.sliderId = sliderId;
        this.sliderTitle = sliderTitle;
        this.image = image;
        this.backlink = backlink;
        this.note = note;
        this.status = status;
        this.subjectName = subjectName;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    
    public int getSliderId() {
        return sliderId;
    }

    public void setSliderId(int sliderId) {
        this.sliderId = sliderId;
    }

    public String getSliderTitle() {
        return sliderTitle;
    }

    public void setSliderTitle(String sliderTitle) {
        this.sliderTitle = sliderTitle;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getBacklink() {
        return backlink;
    }

    public void setBacklink(int backlink) {
        this.backlink = backlink;
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
        return "Slider{" + "sliderId=" + sliderId + ", sliderTitle=" + sliderTitle + ", image=" + image + ", backlink=" + backlink + ", note=" + note + ", status=" + status + '}';
    }
    
}
