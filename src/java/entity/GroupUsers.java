package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
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
    , @NamedQuery(name = "GroupUsers.findByRecordIdUser", query = "SELECT g FROM GroupUsers g WHERE g.recordIdUser = :recordIdUser")
    , @NamedQuery(name = "GroupUsers.findByName", query = "SELECT g FROM GroupUsers g WHERE g.name = :name")})
public class GroupUsers implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "record_id_user")
    private Integer recordIdUser;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "name")
    private String name;
    @JoinColumn(name = "record_id_user", referencedColumnName = "record_id", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Users users;

    public GroupUsers() {
    }

    public GroupUsers(Integer recordIdUser) {
        this.recordIdUser = recordIdUser;
    }

    public GroupUsers(Integer recordIdUser, String name) {
        this.recordIdUser = recordIdUser;
        this.name = name;
    }

    public Integer getRecordIdUser() {
        return recordIdUser;
    }

    public void setRecordIdUser(Integer recordIdUser) {
        this.recordIdUser = recordIdUser;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (recordIdUser != null ? recordIdUser.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GroupUsers)) {
            return false;
        }
        GroupUsers other = (GroupUsers) object;
        if ((this.recordIdUser == null && other.recordIdUser != null) || (this.recordIdUser != null && !this.recordIdUser.equals(other.recordIdUser))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.GroupUsers[ recordIdUser=" + recordIdUser + " ]";
    }
    
}
