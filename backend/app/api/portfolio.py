"""
Portfolio API endpoints for Peemkay SOFTTECH
"""

from fastapi import APIRouter, HTTPException
from typing import List, Dict, Any
from pydantic import BaseModel
from datetime import datetime

router = APIRouter()

class Project(BaseModel):
    """Project model"""
    id: int
    title: str
    description: str
    long_description: str
    technologies: List[str]
    image_url: str
    demo_url: str = None
    github_url: str = None
    category: str
    featured: bool = False
    created_date: datetime
    status: str = "completed"

class PortfolioStats(BaseModel):
    """Portfolio statistics"""
    total_projects: int
    years_experience: int
    technologies_mastered: int
    clients_served: int

# Sample portfolio data
SAMPLE_PROJECTS = [
    {
        "id": 1,
        "title": "E-Commerce Flutter App",
        "description": "Modern cross-platform e-commerce application with Python backend",
        "long_description": "A comprehensive e-commerce solution built with Flutter for mobile and web, featuring user authentication, product catalog, shopping cart, payment integration, and admin dashboard. The backend is powered by Python FastAPI with PostgreSQL database.",
        "technologies": ["Flutter", "Dart", "Python", "FastAPI", "PostgreSQL", "Stripe API"],
        "image_url": "/static/images/projects/ecommerce-app.jpg",
        "demo_url": "https://demo.peemkay-softtech.com/ecommerce",
        "github_url": "https://github.com/peemkay/flutter-ecommerce",
        "category": "Mobile App",
        "featured": True,
        "created_date": datetime(2024, 1, 15),
        "status": "completed"
    },
    {
        "id": 2,
        "title": "AI-Powered Task Manager",
        "description": "Intelligent task management system with AI recommendations",
        "long_description": "A smart task management application that uses machine learning to provide intelligent task prioritization, deadline predictions, and productivity insights. Built with Flutter for the frontend and Python with TensorFlow for AI capabilities.",
        "technologies": ["Flutter", "Python", "TensorFlow", "FastAPI", "MongoDB", "OpenAI API"],
        "image_url": "/static/images/projects/ai-task-manager.jpg",
        "demo_url": "https://demo.peemkay-softtech.com/taskmanager",
        "github_url": "https://github.com/peemkay/ai-task-manager",
        "category": "Web App",
        "featured": True,
        "created_date": datetime(2023, 11, 20),
        "status": "completed"
    },
    {
        "id": 3,
        "title": "Real-time Chat Application",
        "description": "Scalable real-time messaging platform with video calls",
        "long_description": "A modern chat application supporting real-time messaging, file sharing, video calls, and group conversations. Features end-to-end encryption, message reactions, and cross-platform synchronization.",
        "technologies": ["Flutter", "Python", "WebSocket", "Redis", "PostgreSQL", "WebRTC"],
        "image_url": "/static/images/projects/chat-app.jpg",
        "demo_url": "https://demo.peemkay-softtech.com/chat",
        "category": "Mobile App",
        "featured": False,
        "created_date": datetime(2023, 8, 10),
        "status": "completed"
    },
    {
        "id": 4,
        "title": "IoT Dashboard System",
        "description": "Comprehensive IoT device monitoring and control system",
        "long_description": "An enterprise-grade IoT dashboard for monitoring and controlling connected devices. Features real-time data visualization, alerts, device management, and analytics with support for multiple IoT protocols.",
        "technologies": ["Flutter", "Python", "MQTT", "InfluxDB", "Grafana", "Docker"],
        "image_url": "/static/images/projects/iot-dashboard.jpg",
        "category": "Enterprise",
        "featured": True,
        "created_date": datetime(2023, 5, 5),
        "status": "completed"
    }
]

@router.get("/projects", response_model=List[Project])
async def get_projects(featured_only: bool = False, category: str = None):
    """Get all projects or filter by featured/category"""
    projects = SAMPLE_PROJECTS.copy()
    
    if featured_only:
        projects = [p for p in projects if p.get("featured", False)]
    
    if category:
        projects = [p for p in projects if p.get("category", "").lower() == category.lower()]
    
    return projects

@router.get("/projects/{project_id}", response_model=Project)
async def get_project(project_id: int):
    """Get a specific project by ID"""
    project = next((p for p in SAMPLE_PROJECTS if p["id"] == project_id), None)
    if not project:
        raise HTTPException(status_code=404, detail="Project not found")
    return project

@router.get("/stats", response_model=PortfolioStats)
async def get_portfolio_stats():
    """Get portfolio statistics"""
    return PortfolioStats(
        total_projects=len(SAMPLE_PROJECTS),
        years_experience=5,
        technologies_mastered=25,
        clients_served=50
    )

@router.get("/technologies")
async def get_technologies():
    """Get list of technologies used"""
    all_techs = set()
    for project in SAMPLE_PROJECTS:
        all_techs.update(project.get("technologies", []))
    
    return {
        "technologies": sorted(list(all_techs)),
        "categories": {
            "Frontend": ["Flutter", "Dart", "React", "Vue.js", "HTML", "CSS", "JavaScript"],
            "Backend": ["Python", "FastAPI", "Django", "Node.js", "Express"],
            "Database": ["PostgreSQL", "MongoDB", "Redis", "SQLite", "InfluxDB"],
            "Mobile": ["Flutter", "React Native", "iOS", "Android"],
            "AI/ML": ["TensorFlow", "PyTorch", "OpenAI API", "Scikit-learn"],
            "DevOps": ["Docker", "Kubernetes", "AWS", "CI/CD", "Git"]
        }
    }
