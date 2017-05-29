package com.alumna.po;

import java.util.List;

public class UserSayVo {
	private Say say;
	private Student student;
	private Graduate graduate;
	private List<ReviewUserVo> reviewUserVos;
	private Loves loves;
	private int count;
	
	/**
	 * @return the count
	 */
	public int getCount() {
		return count;
	}
	/**
	 * @param count the count to set
	 */
	public void setCount(int count) {
		this.count = count;
	}
	/**
	 * @return the say
	 */
	public Say getSay() {
		return say;
	}
	/**
	 * @param say the say to set
	 */
	public void setSay(Say say) {
		this.say = say;
	}
	/**
	 * @return the student
	 */
	public Student getStudent() {
		return student;
	}
	/**
	 * @param student the student to set
	 */
	public void setStudent(Student student) {
		this.student = student;
	}
	/**
	 * @return the graduate
	 */
	public Graduate getGraduate() {
		return graduate;
	}
	/**
	 * @param graduate the graduate to set
	 */
	public void setGraduate(Graduate graduate) {
		this.graduate = graduate;
	}
	
	/**
	 * @return the reviewUserVos
	 */
	public List<ReviewUserVo> getReviewUserVos() {
		return reviewUserVos;
	}
	/**
	 * @param reviewUserVos the reviewUserVos to set
	 */
	public void setReviewUserVos(List<ReviewUserVo> reviewUserVos) {
		this.reviewUserVos = reviewUserVos;
	}
	/**
	 * @return the loves
	 */
	public Loves getLoves() {
		return loves;
	}
	/**
	 * @param loves the loves to set
	 */
	public void setLoves(Loves loves) {
		this.loves = loves;
	}
}
