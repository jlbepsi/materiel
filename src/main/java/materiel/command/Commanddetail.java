package materiel.command;


import materiel.component.Component;

import javax.persistence.*;

@Entity
public class Commanddetail {
  @EmbeddedId
  private CommanddetailIdentity identity;

  private long quantity;

  public Commanddetail() {
    this.identity = new CommanddetailIdentity();
  }
  public Commanddetail(CommanddetailIdentity identity)
  {
    this.identity = identity;
  }


  public long getCommandId() {
    return this.identity.getCommandId();
  }
  public void setCommandId(long cmdId) {
    this.identity.setCommandId(cmdId);
  }

  public Component getComponent() {
    return this.identity.getComponent();
  }
  public void setComponent(Component component) {
    this.identity.setComponent(component);
  }

  public long getQuantity() {
    return quantity;
  }
  public void setQuantity(long quantity) {
    this.quantity = quantity;
  }

}
