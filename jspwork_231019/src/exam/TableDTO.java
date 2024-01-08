package exam;

public class TableDTO {
	private String column_name;
	private String column_type;
	private int column_length;
	private String nullable;
//	+ 필드멤버 getter/setter
	
	
	public String getColumn_name() {
		return column_name;
	}
	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}
	public String getColumn_type() {
		return column_type;
	}
	public void setColumn_type(String column_type) {
		this.column_type = column_type;
	}
	public int getColumn_length() {
		return column_length;
	}
	public void setColumn_length(int column_length) {
		this.column_length = column_length;
	}
	public String getNullable() {
		return nullable;
	}
	public void setNullable(String nullable) {
		this.nullable = nullable;
	}
	
}
