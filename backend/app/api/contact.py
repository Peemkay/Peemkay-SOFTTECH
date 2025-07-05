"""
Contact API endpoints for Peemkay SOFTTECH
"""

from fastapi import APIRouter, HTTPException, BackgroundTasks
from pydantic import BaseModel, EmailStr
from typing import Optional
from datetime import datetime
import logging

router = APIRouter()

class ContactForm(BaseModel):
    """Contact form model"""
    name: str
    email: EmailStr
    subject: str
    message: str
    phone: Optional[str] = None
    company: Optional[str] = None
    project_type: Optional[str] = None

class ContactInfo(BaseModel):
    """Contact information model"""
    company_name: str
    founder_name: str
    email: str
    phone: str
    address: str
    social_media: dict

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

async def send_email_notification(contact_data: ContactForm):
    """Background task to send email notification"""
    # In production, implement actual email sending
    logger.info(f"New contact form submission from {contact_data.name} ({contact_data.email})")
    logger.info(f"Subject: {contact_data.subject}")
    logger.info(f"Message: {contact_data.message}")

@router.post("/submit")
async def submit_contact_form(
    contact_form: ContactForm,
    background_tasks: BackgroundTasks
):
    """Submit contact form"""
    try:
        # Add background task to send email
        background_tasks.add_task(send_email_notification, contact_form)
        
        # In production, save to database
        logger.info(f"Contact form submitted by {contact_form.name}")
        
        return {
            "success": True,
            "message": "Thank you for your message! We'll get back to you soon.",
            "submitted_at": datetime.now().isoformat()
        }
    except Exception as e:
        logger.error(f"Error submitting contact form: {str(e)}")
        raise HTTPException(status_code=500, detail="Failed to submit contact form")

@router.get("/info", response_model=ContactInfo)
async def get_contact_info():
    """Get contact information"""
    return ContactInfo(
        company_name="Peemkay SOFTTECH",
        founder_name="Peemkay",
        email="ariepeemkay@gmail.com",
        phone="+2349113080869",
        address="Peemkay SOFTTECH, Dutsen Alhaji, Abuja, Nigeria",
        social_media={
            "linkedin": "https://linkedin.com/in/peemkay",
            "github": "https://github.com/peemkay",
            "twitter": "https://twitter.com/peemkay",
            "instagram": "https://instagram.com/peemkay_softtech"
        }
    )

@router.get("/services-inquiry")
async def get_service_types():
    """Get available service types for inquiry"""
    return {
        "service_types": [
            "Mobile App Development",
            "Web Application Development",
            "Desktop Application Development",
            "API Development",
            "Database Design",
            "UI/UX Design",
            "Consulting",
            "Maintenance & Support",
            "Custom Software Solutions",
            "AI/ML Integration"
        ],
        "project_budgets": [
            "Under $5,000",
            "$5,000 - $15,000",
            "$15,000 - $50,000",
            "$50,000 - $100,000",
            "Over $100,000"
        ],
        "timelines": [
            "Less than 1 month",
            "1-3 months",
            "3-6 months",
            "6-12 months",
            "Over 1 year"
        ]
    }
