
package Models;

public class Dimension {
    private int dimensionId;
    private int subjectId;
    private String dimensionName;
    private String description;
    private int typeId;
    private String typeName;

    private DimensionType dimensionType;
    private String subjectName;

    public Dimension() {}

    public Dimension(int dimensionId, String dimensionName, String description, int typeId) {
        this.dimensionId = dimensionId;
        this.dimensionName = dimensionName;
        this.description = description;
        this.typeId = typeId;
    }

    public Dimension(int dimensionId, String dimensionName, String description, int typeId, int subjectId, String typeName) {
        this.dimensionId = dimensionId;
        this.subjectId = subjectId;
        this.dimensionName = dimensionName;
        this.description = description;
        this.typeId = typeId;
        this.typeName = typeName;
    }

    public Dimension(int dimensionId, int subjectId, String dimensionName, String description, int typeId, String typeName, DimensionType dimensionType) {
        this.dimensionId = dimensionId;
        this.subjectId = subjectId;
        this.dimensionName = dimensionName;
        this.description = description;
        this.typeId = typeId;
        this.typeName = typeName;
        this.dimensionType = dimensionType;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }


    public DimensionType getDimensionType() {
        return dimensionType;
    }

    public void setDimensionType(DimensionType dimensionType) {
        this.dimensionType = dimensionType;
    }
    
    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getDimensionId() {
        return dimensionId;
    }

    public void setDimensionId(int dimensionId) {
        this.dimensionId = dimensionId;
    }

    public String getDimensionName() {
        return dimensionName;
    }

    public void setDimensionName(String dimensionName) {
        this.dimensionName = dimensionName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    @Override
    public String toString() {
        return "Dimension{" + "dimensionId=" + dimensionId + ", subjectId=" + subjectId + ", dimensionName=" + dimensionName + ", description=" + description + ", typeId=" + typeId + ", typeName=" + typeName + '}';
    }

    
    
}
