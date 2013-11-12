#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"

#include <cstdlib>

#define PTM_RATIO 32.0

@interface HelloWorldLayer : CCLayer {
   
    b2World *_world;
    
    GLESDebugDraw * m_debugDraw;		// strong ref
    
   }

+ (id) scene;

@end