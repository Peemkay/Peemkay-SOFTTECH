"""
Peemkay SOFTTECH Portfolio Website - Backend API
FastAPI application serving the portfolio website backend
"""

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from fastapi.responses import HTMLResponse
import uvicorn
from pathlib import Path

from app.api import portfolio, contact, services
from app.core.config import settings

# Create FastAPI application
app = FastAPI(
    title="Peemkay SOFTTECH Portfolio API",
    description="Backend API for Peemkay SOFTTECH portfolio website",
    version="1.0.0",
    docs_url="/api/docs",
    redoc_url="/api/redoc",
)

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.ALLOWED_HOSTS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include API routers
app.include_router(portfolio.router, prefix="/api/v1/portfolio", tags=["portfolio"])
app.include_router(contact.router, prefix="/api/v1/contact", tags=["contact"])
app.include_router(services.router, prefix="/api/v1/services", tags=["services"])

# Serve static files
static_path = Path(__file__).parent / "static"
if static_path.exists():
    app.mount("/static", StaticFiles(directory=static_path), name="static")

@app.get("/", response_class=HTMLResponse)
async def root():
    """Root endpoint with API information"""
    return """
    <html>
        <head>
            <title>Peemkay SOFTTECH Portfolio API</title>
            <style>
                body { font-family: Arial, sans-serif; margin: 40px; background: #f5f5f5; }
                .container { max-width: 800px; margin: 0 auto; background: white; padding: 40px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
                h1 { color: #2c3e50; border-bottom: 3px solid #3498db; padding-bottom: 10px; }
                .api-link { display: inline-block; margin: 10px 15px 10px 0; padding: 10px 20px; background: #3498db; color: white; text-decoration: none; border-radius: 5px; }
                .api-link:hover { background: #2980b9; }
                .info { background: #ecf0f1; padding: 20px; border-radius: 5px; margin: 20px 0; }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>🚀 Peemkay SOFTTECH Portfolio API</h1>
                <div class="info">
                    <p><strong>Welcome to the backend API for Peemkay SOFTTECH portfolio website!</strong></p>
                    <p>This API serves data for the modern, cross-platform portfolio website built with Flutter and Python.</p>
                </div>
                
                <h2>📚 API Documentation</h2>
                <a href="/api/docs" class="api-link">Interactive API Docs (Swagger)</a>
                <a href="/api/redoc" class="api-link">ReDoc Documentation</a>
                
                <h2>🔗 Available Endpoints</h2>
                <ul>
                    <li><strong>/api/v1/portfolio</strong> - Portfolio and project data</li>
                    <li><strong>/api/v1/contact</strong> - Contact form and information</li>
                    <li><strong>/api/v1/services</strong> - Services and offerings</li>
                </ul>
                
                <div class="info">
                    <p><strong>Founder:</strong> Peemkay</p>
                    <p><strong>Company:</strong> Peemkay SOFTTECH</p>
                    <p><strong>Specialization:</strong> Python & Flutter Development</p>
                </div>
            </div>
        </body>
    </html>
    """

@app.get("/health")
async def health_check():
    """Health check endpoint"""
    return {"status": "healthy", "message": "Peemkay SOFTTECH Portfolio API is running"}

if __name__ == "__main__":
    uvicorn.run(
        "main:app",
        host=settings.HOST,
        port=settings.PORT,
        reload=settings.DEBUG,
        log_level="info"
    )
