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
import javax.persistence.ManyToMany;
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
@Table(name = "places")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Places.findAll", query = "SELECT p FROM Places p")
    , @NamedQuery(name = "Places.findByRecordId", query = "SELECT p FROM Places p WHERE p.recordId = :recordId")
    , @NamedQuery(name = "Places.findByName", query = "SELECT p FROM Places p WHERE p.name = :name")
    , @NamedQuery(name = "Places.findByDateCreated", query = "SELECT p FROM Places p WHERE p.dateCreated = :dateCreated")})
public class Places implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "record_id")
    private Integer recordId;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "name")
    private String name;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_created")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreated;
    
    @ManyToMany(mappedBy = "placesCollection")
    private Collection<Users> usersCollection;
    
    @JoinColumn(name = "record_id_object", referencedColumnName = "record_id")
    @ManyToOne(optional = false)
    private Objects recordIdObject;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "recordIdPlace")
    private Collection<Works> worksCollection;

    public Places() {
    }

    public Places(Integer recordId) {
        this.recordId = recordId;
    }

    public Places(Integer recordId, String name, Date dateCreated) {
        this.recordId = recordId;
        this.name = name;
        this.dateCreated = dateCreated;
    }

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    @XmlTransient
    public Collection<Users> getUsersCollection() {
        return usersCollection;
    }

    public void setUsersCollection(Collection<Users> usersCollection) {
        this.usersCollection = usersCollection;
    }

    public Objects getRecordIdObject() {
        return recordIdObject;
    }

    public void setRecordIdObject(Objects recordIdObject) {
        this.recordIdObject = recordIdObject;
    }

    @XmlTransient
    public Collection<Works> getWorksCollection() {
        return worksCollection;
    }

    public void setWorksCollection(Collection<Works> worksCollection) {
        this.worksCollection = worksCollection;
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
        if (!(object instanceof Places)) {
            return false;
        }
        Places other = (Places) object;
        if ((this.recordId == null && other.recordId != null) || (this.recordId != null && !this.recordId.equals(other.recordId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Places[ recordId=" + recordId + " ]";
    }
    
}
