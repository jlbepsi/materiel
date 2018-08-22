package materiel.command;

import materiel.component.Component;

import javax.persistence.*;
import java.io.Serializable;


/**
 *
 * http://www.hostettler.net/blog/2012/03/22/one-to-one-relations-in-jpa-2-dot-0/
 *
 * https://vladmihalcea.com/the-best-way-to-map-a-onetoone-relationship-with-jpa-and-hibernate/
 *
 * http://blog.paumard.org/cours/jpa/chap03-entite-objets-inclus.html
 *
 */


@Embeddable
public class CommanddetailIdentity implements Serializable {
    private long commandId;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "component_id") private Component component;


    public CommanddetailIdentity() {

    }

    public CommanddetailIdentity(long commandId, long componentId) {
        this.component = new Component();
        this.component.setId(componentId);
        this.commandId = commandId;
    }

    public long getCommandId() {
        return commandId;
    }
    public void setCommandId(long commandId) {
        this.commandId = commandId;
    }


    public Component getComponent() {
        return this.component;
    }
    public void setComponent(Component component) {
        this.component = component;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;

        CommanddetailIdentity that = (CommanddetailIdentity) object;

        if (! (commandId == that.commandId)) return false;
        return component.getId() == that.component.getId();
    }
}
