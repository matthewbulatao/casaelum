package localservice.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class ApplicationProperties implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private int maxAdultPerBooking;
	private int maxChildrenPerBooking;
	private double entranceFeeAdult;
	private double entranceFeeChild;
	@Temporal(TemporalType.TIMESTAMP)
	private Date changeDate;
	
	public int getMaxAdultPerBooking() {
		return maxAdultPerBooking;
	}
	public void setMaxAdultPerBooking(int maxAdultPerBooking) {
		this.maxAdultPerBooking = maxAdultPerBooking;
	}
	public int getMaxChildrenPerBooking() {
		return maxChildrenPerBooking;
	}
	public void setMaxChildrenPerBooking(int maxChildrenPerBooking) {
		this.maxChildrenPerBooking = maxChildrenPerBooking;
	}
	public double getEntranceFeeAdult() {
		return entranceFeeAdult;
	}
	public void setEntranceFeeAdult(double entranceFeeAdult) {
		this.entranceFeeAdult = entranceFeeAdult;
	}
	public double getEntranceFeeChild() {
		return entranceFeeChild;
	}
	public void setEntranceFeeChild(double entranceFeeChild) {
		this.entranceFeeChild = entranceFeeChild;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}
	
	@Override
	public String toString() {
		return "ApplicationProperties [id=" + id + ", maxAdultPerBooking=" + maxAdultPerBooking
				+ ", maxChildrenPerBooking=" + maxChildrenPerBooking + ", entranceFeeAdult=" + entranceFeeAdult
				+ ", entranceFeeChild=" + entranceFeeChild + ", changeDate=" + changeDate + "]";
	}
}
