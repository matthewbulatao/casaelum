package localservice.models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
public class Reservation implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String referenceId;
	private String type;
	@Temporal(TemporalType.TIMESTAMP)
	private Date checkIn;
	@Temporal(TemporalType.TIMESTAMP)
	private Date checkOut;
	private int countAdult;
	private int countChildren;
	private String status;	
	private String remarks;
	private double totalAmount;
	private double dpAmount;
	@ManyToMany
	private List<Miscellaneous> amenities;
	@ManyToOne
	private Guest mainGuest;
	private String extraChargeDescription;
	private double extraChargeAmount;
	@ManyToMany(fetch=FetchType.EAGER)
	private List<Room> rooms;
	private double balanceUponCheckout;
	
	@Transient
	private String[] selectedRoomIds;
	@Transient
	private String[] selectedAmenitiesIds;
	@Transient
	private List<Miscellaneous> miscellaneousList;
	@Transient
	private String firstName;
	@Transient
	private String lastName;
	@Transient
	private String contactNumber;
	@Transient
	private String email;
	@Transient
	private String paymentMethod;	
	
	
	public double getBalanceUponCheckout() {
		return balanceUponCheckout;
	}
	public void setBalanceUponCheckout(double balanceUponCheckout) {
		this.balanceUponCheckout = balanceUponCheckout;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getReferenceId() {
		return referenceId;
	}
	public void setReferenceId(String referenceId) {
		this.referenceId = referenceId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}
	public int getCountAdult() {
		return countAdult;
	}
	public void setCountAdult(int countAdult) {
		this.countAdult = countAdult;
	}
	public int getCountChildren() {
		return countChildren;
	}
	public void setCountChildren(int countChildren) {
		this.countChildren = countChildren;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String[] getSelectedRoomIds() {
		return selectedRoomIds;
	}
	public void setSelectedRoomIds(String[] selectedRoomIds) {
		this.selectedRoomIds = selectedRoomIds;
	}
	public List<Room> getRooms() {
		return rooms;
	}
	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}
	public List<Miscellaneous> getMiscellaneousList() {
		return miscellaneousList;
	}
	public void setMiscellaneousList(List<Miscellaneous> miscellaneousList) {
		this.miscellaneousList = miscellaneousList;
	}	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Guest getMainGuest() {
		return mainGuest;
	}
	public void setMainGuest(Guest mainGuest) {
		this.mainGuest = mainGuest;
	}	
	public List<Miscellaneous> getAmenities() {
		return amenities;
	}
	public void setAmenities(List<Miscellaneous> amenities) {
		this.amenities = amenities;
	}
	public String getExtraChargeDescription() {
		return extraChargeDescription;
	}
	public void setExtraChargeDescription(String extraChargeDescription) {
		this.extraChargeDescription = extraChargeDescription;
	}
	public double getExtraChargeAmount() {
		return extraChargeAmount;
	}
	public void setExtraChargeAmount(double extraChargeAmount) {
		this.extraChargeAmount = extraChargeAmount;
	}
	public String[] getSelectedAmenitiesIds() {
		return selectedAmenitiesIds;
	}
	public void setSelectedAmenitiesIds(String[] selectedAmenitiesIds) {
		this.selectedAmenitiesIds = selectedAmenitiesIds;
	}	
	public double getDpAmount() {
		return dpAmount;
	}
	public void setDpAmount(double dpAmount) {
		this.dpAmount = dpAmount;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + ((referenceId == null) ? 0 : referenceId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Reservation other = (Reservation) obj;
		if (id != other.id)
			return false;
		if (referenceId == null) {
			if (other.referenceId != null)
				return false;
		} else if (!referenceId.equals(other.referenceId))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Reservation [id=" + id + ", referenceNumber=" + referenceId + ", type=" + type + ", checkIn="
				+ checkIn + ", checkOut=" + checkOut + ", countAdult=" + countAdult + ", countChildren=" + countChildren
				+ ", status=" + status + "]";
	}	
}
