package entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Mr.Minakov
 */
@Entity
@Table(name = "work_process")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "WorkProcess.findAll", query = "SELECT w FROM WorkProcess w")
    , @NamedQuery(name = "WorkProcess.findByRecordId", query = "SELECT w FROM WorkProcess w WHERE w.recordId = :recordId")
    , @NamedQuery(name = "WorkProcess.findByDate", query = "SELECT w FROM WorkProcess w WHERE w.date = :date")
    , @NamedQuery(name = "WorkProcess.findByQuantity", query = "SELECT w FROM WorkProcess w WHERE w.quantity = :quantity")})
public class WorkProcess implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "record_id")
    private Integer recordId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "quantity")
    private String quantity;
    @Lob
    @Size(max = 65535)
    @Column(name = "notes")
    private String notes;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "recordIdWorkProcess")
    private Collection<Types> typesCollection;
    @JoinColumn(name = "record_id_work", referencedColumnName = "record_id")
    @ManyToOne(optional = false)
    private Works recordIdWork;

    public WorkProcess() {
    }

    public WorkProcess(Integer recordId) {
        this.recordId = recordId;
    }

    public WorkProcess(Integer recordId, Date date, String quantity) {
        this.recordId = recordId;
        this.date = date;
        this.quantity = quantity;
    }

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @XmlTransient
    public Collection<Types> getTypesCollection() {
        return typesCollection;
    }

    public void setTypesCollection(Collection<Types> typesCollection) {
        this.typesCollection = typesCollection;
    }

    public Works getRecordIdWork() {
        return recordIdWork;
    }

    public void setRecordIdWork(Works recordIdWork) {
        this.recordIdWork = recordIdWork;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (recordId != null ? recordId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof WorkProcess)) {
            return false;
        }
        WorkProcess other = (WorkProcess) object;
        if ((this.recordId == null && other.recordId != null) || (this.recordId != null && !this.recordId.equals(other.recordId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.WorkProcess[ recordId=" + recordId + " ]";
    }
    
}
