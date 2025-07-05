#!/usr/bin/env python3
"""
Create Peemkay SOFTTECH Logo and Favicons
Generates professional app logo and favicon files for the portfolio website
"""

from PIL import Image, ImageDraw, ImageFont
import os

# Brand colors
TOMATO = (255, 99, 71)  # #FF6347
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
DARK_GRAY = (26, 26, 26)  # #1A1A1A

def create_logo(size, filename):
    """Create Peemkay SOFTTECH logo"""
    # Create image with transparent background
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Calculate dimensions
    center = size // 2
    radius = size // 3
    
    # Draw outer circle (tomato)
    draw.ellipse([center - radius, center - radius, center + radius, center + radius], 
                 fill=TOMATO, outline=TOMATO, width=3)
    
    # Draw inner circle (black)
    inner_radius = radius - size // 12
    draw.ellipse([center - inner_radius, center - inner_radius, center + inner_radius, center + inner_radius], 
                 fill=BLACK, outline=BLACK)
    
    # Draw "P" in the center
    try:
        # Try to use a system font
        font_size = size // 4
        font = ImageFont.truetype("arial.ttf", font_size)
    except:
        # Fallback to default font
        font = ImageFont.load_default()
    
    # Draw "P" letter
    text = "P"
    bbox = draw.textbbox((0, 0), text, font=font)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]
    
    text_x = center - text_width // 2
    text_y = center - text_height // 2
    
    draw.text((text_x, text_y), text, fill=TOMATO, font=font)
    
    # Save the image
    img.save(filename, 'PNG')
    print(f"Created logo: {filename}")

def create_favicon(size, filename):
    """Create favicon with simpler design for small sizes"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    if size >= 64:
        # For larger sizes, use the full logo
        create_logo(size, filename)
    else:
        # For smaller sizes, use a simpler design
        center = size // 2
        
        # Draw background circle
        draw.ellipse([2, 2, size-2, size-2], fill=TOMATO, outline=TOMATO)
        
        # Draw "P" 
        try:
            font_size = max(8, size // 3)
            font = ImageFont.truetype("arial.ttf", font_size)
        except:
            font = ImageFont.load_default()
        
        text = "P"
        bbox = draw.textbbox((0, 0), text, font=font)
        text_width = bbox[2] - bbox[0]
        text_height = bbox[3] - bbox[1]
        
        text_x = center - text_width // 2
        text_y = center - text_height // 2
        
        draw.text((text_x, text_y), text, fill=WHITE, font=font)
        
        img.save(filename, 'PNG')
        print(f"Created favicon: {filename}")

def main():
    """Generate all logo and favicon files"""
    print("🎨 Creating Peemkay SOFTTECH Logo and Favicons...")
    
    # Create directories if they don't exist
    os.makedirs('assets/icons', exist_ok=True)
    os.makedirs('web/icons', exist_ok=True)
    
    # Create main app logo (high resolution)
    create_logo(512, 'assets/icons/app_logo.png')
    create_logo(256, 'assets/icons/app_logo_256.png')
    create_logo(128, 'assets/icons/app_logo_128.png')
    
    # Create web favicons
    create_favicon(16, 'web/favicon.png')
    create_favicon(32, 'web/favicon-32x32.png')
    create_favicon(192, 'web/icons/Icon-192.png')
    create_favicon(512, 'web/icons/Icon-512.png')
    
    # Create maskable icons (for PWA)
    create_logo(192, 'web/icons/Icon-maskable-192.png')
    create_logo(512, 'web/icons/Icon-maskable-512.png')
    
    # Create Apple touch icon
    create_logo(180, 'web/apple-touch-icon.png')
    
    print("✅ All logos and favicons created successfully!")
    print("\nFiles created:")
    print("📱 App Logos:")
    print("  - assets/icons/app_logo.png (512x512)")
    print("  - assets/icons/app_logo_256.png (256x256)")
    print("  - assets/icons/app_logo_128.png (128x128)")
    print("\n🌐 Web Favicons:")
    print("  - web/favicon.png (16x16)")
    print("  - web/favicon-32x32.png (32x32)")
    print("  - web/icons/Icon-192.png (192x192)")
    print("  - web/icons/Icon-512.png (512x512)")
    print("  - web/icons/Icon-maskable-192.png (192x192)")
    print("  - web/icons/Icon-maskable-512.png (512x512)")
    print("  - web/apple-touch-icon.png (180x180)")

if __name__ == "__main__":
    main()
