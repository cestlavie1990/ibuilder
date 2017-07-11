package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Mr.Minakov
 */
@Entity
@Table(name = "group_users")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "GroupUsers.findAll", query = "SELECT g FROM GroupUsers g")
    , @NamedQuery(name = "GroupUsers.findByGroupName", query = "SELECT g FROM GroupUsers g WHERE g.groupName = :groupName")
    , @NamedQuery(name = "GroupUsers.findByUserLogin", query = "SELECT g FROM GroupUsers g WHERE g.userLogin = :userLogin")})
public class GroupUsers implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "record_id")
    private Integer recordId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "group_name")
    private String groupName;
    @JoinColumn(name = "user_login", referencedColumnName = "login")
    @ManyToOne(optional = false)
    private Users userLogin;



    public GroupUsers() {
    }

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Users getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(Users userLogin) {
        this.userLogin = userLogin;
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
        if (!(object instanceof GroupUsers)) {
            return false;
        }
        GroupUsers other = (GroupUsers) object;
        if ((this.recordId == null && other.recordId != null) || (this.recordId != null && !this.recordId.equals(other.recordId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.GroupUsers[ recordId=" + recordId + " ]";
    }
    
}
