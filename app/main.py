from fastapi import FastAPI, HTTPException
from sqlalchemy.orm import Session
from app.database import Contact, SessionLocal, engine, Base

Base.metadata.create_all(bind=engine)

app = FastAPI()

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/contacts/")
def create_contact(contact: dict, db: Session = next(get_db())):
    db_contact = Contact(name=contact["name"], email=contact["email"])
    db.add(db_contact)
    db.commit()
    db.refresh(db_contact)
    return db_contact

@app.get("/contacts/")
def read_contacts(db: Session = next(get_db())):
    return db.query(Contact).all()

@app.get("/contacts/{contact_id}")
def read_contact(contact_id: int, db: Session = next(get_db())):
    contact = db.query(Contact).get(contact_id)
    if not contact:
        raise HTTPException(status_code=404, detail="Contact not found")
    return contact

@app.put("/contacts/{contact_id}")
def update_contact(contact_id: int, updated: dict, db: Session = next(get_db())):
    contact = db.query(Contact).get(contact_id)
    if not contact:
        raise HTTPException(status_code=404, detail="Not found")
    contact.name = updated.get("name", contact.name)
    contact.email = updated.get("email", contact.email)
    db.commit()
    return contact

@app.delete("/contacts/{contact_id}")
def delete_contact(contact_id: int, db: Session = next(get_db())):
    contact = db.query(Contact).get(contact_id)
    if not contact:
        raise HTTPException(status_code=404, detail="Not found")
    db.delete(contact)
    db.commit()
    return {"detail": "Deleted"}
