"""
Services API endpoints for Peemkay SOFTTECH
"""

from fastapi import APIRouter
from pydantic import BaseModel
from typing import List, Dict, Any

router = APIRouter()

class Service(BaseModel):
    """Service model"""
    id: int
    title: str
    description: str
    detailed_description: str
    icon: str
    features: List[str]
    technologies: List[str]
    starting_price: str
    delivery_time: str
    category: str

class ServiceCategory(BaseModel):
    """Service category model"""
    name: str
    description: str
    services: List[Service]

# Sample services data
SERVICES_DATA = [
    {
        "id": 1,
        "title": "Mobile App Development",
        "description": "Cross-platform mobile applications using Flutter",
        "detailed_description": "Create stunning, high-performance mobile applications that work seamlessly across iOS and Android platforms. Using Flutter framework, we deliver native-quality apps with a single codebase, reducing development time and costs while maintaining excellent user experience.",
        "icon": "fas fa-mobile-alt",
        "features": [
            "Cross-platform compatibility (iOS & Android)",
            "Native performance and look",
            "Custom UI/UX design",
            "API integration",
            "Push notifications",
            "Offline functionality",
            "App store deployment",
            "Maintenance and updates"
        ],
        "technologies": ["Flutter", "Dart", "Firebase", "REST APIs", "SQLite"],
        "starting_price": "$5,000",
        "delivery_time": "4-8 weeks",
        "category": "Mobile Development"
    },
    {
        "id": 2,
        "title": "Web Application Development",
        "description": "Modern, responsive web applications with Python backend",
        "detailed_description": "Build scalable, secure web applications using modern technologies. From simple websites to complex enterprise solutions, we create responsive, fast-loading applications with robust backend systems that grow with your business.",
        "icon": "fas fa-globe",
        "features": [
            "Responsive design",
            "Modern UI frameworks",
            "RESTful API development",
            "Database integration",
            "User authentication",
            "Payment processing",
            "SEO optimization",
            "Performance optimization"
        ],
        "technologies": ["Python", "FastAPI", "React", "Vue.js", "PostgreSQL", "Redis"],
        "starting_price": "$3,000",
        "delivery_time": "3-6 weeks",
        "category": "Web Development"
    },
    {
        "id": 3,
        "title": "Desktop Application Development",
        "description": "Cross-platform desktop applications with Flutter",
        "detailed_description": "Develop powerful desktop applications that run on Windows, macOS, and Linux. Using Flutter for desktop, we create applications with native performance and consistent user experience across all platforms.",
        "icon": "fas fa-desktop",
        "features": [
            "Cross-platform (Windows, macOS, Linux)",
            "Native system integration",
            "File system access",
            "Hardware integration",
            "Offline capabilities",
            "Auto-updates",
            "Custom installers",
            "Performance optimization"
        ],
        "technologies": ["Flutter", "Dart", "SQLite", "Native APIs"],
        "starting_price": "$4,000",
        "delivery_time": "4-7 weeks",
        "category": "Desktop Development"
    },
    {
        "id": 4,
        "title": "API Development & Integration",
        "description": "Robust RESTful APIs and third-party integrations",
        "detailed_description": "Design and develop scalable APIs that power your applications. We create well-documented, secure APIs and integrate with third-party services to extend your application's functionality.",
        "icon": "fas fa-code",
        "features": [
            "RESTful API design",
            "API documentation",
            "Authentication & authorization",
            "Rate limiting",
            "Third-party integrations",
            "Webhook implementation",
            "API testing",
            "Performance monitoring"
        ],
        "technologies": ["Python", "FastAPI", "OpenAPI", "JWT", "OAuth2"],
        "starting_price": "$2,000",
        "delivery_time": "2-4 weeks",
        "category": "Backend Development"
    },
    {
        "id": 5,
        "title": "AI/ML Integration",
        "description": "Artificial Intelligence and Machine Learning solutions",
        "detailed_description": "Integrate AI and ML capabilities into your applications. From chatbots to predictive analytics, we implement cutting-edge AI solutions that add intelligent features to your software.",
        "icon": "fas fa-brain",
        "features": [
            "Custom ML models",
            "Natural language processing",
            "Computer vision",
            "Predictive analytics",
            "Chatbot development",
            "Recommendation systems",
            "Data analysis",
            "Model deployment"
        ],
        "technologies": ["Python", "TensorFlow", "PyTorch", "OpenAI API", "Scikit-learn"],
        "starting_price": "$6,000",
        "delivery_time": "6-10 weeks",
        "category": "AI/ML"
    },
    {
        "id": 6,
        "title": "UI/UX Design",
        "description": "Modern, user-centered design for all platforms",
        "detailed_description": "Create beautiful, intuitive user interfaces that provide exceptional user experiences. Our design process focuses on user research, wireframing, prototyping, and testing to ensure your application is both beautiful and functional.",
        "icon": "fas fa-paint-brush",
        "features": [
            "User research & analysis",
            "Wireframing & prototyping",
            "Visual design",
            "Responsive design",
            "Accessibility compliance",
            "Design systems",
            "User testing",
            "Design handoff"
        ],
        "technologies": ["Figma", "Adobe XD", "Sketch", "InVision", "Principle"],
        "starting_price": "$2,500",
        "delivery_time": "2-5 weeks",
        "category": "Design"
    }
]

@router.get("/", response_model=List[Service])
async def get_all_services():
    """Get all services"""
    return SERVICES_DATA

@router.get("/{service_id}", response_model=Service)
async def get_service(service_id: int):
    """Get a specific service by ID"""
    service = next((s for s in SERVICES_DATA if s["id"] == service_id), None)
    if not service:
        raise HTTPException(status_code=404, detail="Service not found")
    return service

@router.get("/category/{category_name}")
async def get_services_by_category(category_name: str):
    """Get services by category"""
    services = [s for s in SERVICES_DATA if s["category"].lower().replace(" ", "-") == category_name.lower()]
    return {"category": category_name, "services": services}

@router.get("/categories/list")
async def get_service_categories():
    """Get all service categories"""
    categories = {}
    for service in SERVICES_DATA:
        category = service["category"]
        if category not in categories:
            categories[category] = []
        categories[category].append(service)
    
    return {
        "categories": [
            {"name": cat, "count": len(services), "services": services}
            for cat, services in categories.items()
        ]
    }
