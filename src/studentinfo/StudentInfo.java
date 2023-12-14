package studentinfo;

public class StudentInfo {
	private String name;
	private int userNum;
	private String birth;
	private String admin_year;
	private String gradu_year;
	private String gender;
	private String address;
	private String email;
	private String tel;
	private int grade;
	private int semester;
	private int dept_id;
	private int status;
	private int registed;
	private String dept_name;
	
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getRegisted() {
		return registed;
	}
	public void setRegisted(int registed) {
		this.registed = registed;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAdmin_year() {
		return admin_year;
	}
	public void setAdmin_year(String admin_year) {
		this.admin_year = admin_year;
	}
	public String getGradu_year() {
		return gradu_year;
	}
	public void setGradu_year(String gradu_year) {
		this.gradu_year = gradu_year;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	
}
