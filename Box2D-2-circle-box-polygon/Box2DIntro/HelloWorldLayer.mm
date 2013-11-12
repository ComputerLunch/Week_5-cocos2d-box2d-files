#import "HelloWorldLayer.h"

@implementation HelloWorldLayer

+ (id)scene {
    
    CCScene *scene = [CCScene node];
    HelloWorldLayer *layer = [HelloWorldLayer node];
    [scene addChild:layer];
    return scene;
}

- (id)init {
    
    if ((self=[super init])) {
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        // Create a world
        b2Vec2 gravity = b2Vec2(0.0f, -30.0f);
        _world = new b2World(gravity);
        
        
        m_debugDraw = new GLESDebugDraw( PTM_RATIO );
        _world->SetDebugDraw(m_debugDraw);

        uint32 flags = 0;
        flags += b2Draw::e_shapeBit;
        //		flags += b2Draw::e_jointBit;
        //		flags += b2Draw::e_aabbBit;
        //		flags += b2Draw::e_pairBit;
        //		flags += b2Draw::e_centerOfMassBit;
        m_debugDraw->SetFlags(flags);
        
        
        // Create edges around the entire screen
        b2BodyDef groundBodyDef;
        groundBodyDef.position.Set(0,0);
        b2Body *groundBody = _world->CreateBody(&groundBodyDef);
        b2EdgeShape groundEdge;
        b2FixtureDef boxShapeDef;
        boxShapeDef.shape = &groundEdge;
        groundEdge.Set(b2Vec2(0,0), b2Vec2(winSize.width/PTM_RATIO, 0));
        groundBody->CreateFixture(&boxShapeDef);
        groundEdge.Set(b2Vec2(0,0), b2Vec2(0, winSize.height/PTM_RATIO));
        groundBody->CreateFixture(&boxShapeDef);
        groundEdge.Set(b2Vec2(0, winSize.height/PTM_RATIO), 
                       b2Vec2(winSize.width/PTM_RATIO, winSize.height/PTM_RATIO));
        groundBody->CreateFixture(&boxShapeDef);
        groundEdge.Set(b2Vec2(winSize.width/PTM_RATIO, 
                              winSize.height/PTM_RATIO), b2Vec2(winSize.width/PTM_RATIO, 0));
        groundBody->CreateFixture(&boxShapeDef);
        
        
        
        [self makeABallx:100 y:100];
        [self makeABallx:120 y:120];
        [self makeABallx:140 y:140];
        [self makeABallx:160 y:160];
        [self makeABallx:180 y:180];
        [self makeABallx:200 y:200];
        [self makeABallx:220 y:220];
        [self makeABallx:240 y:240];
        [self makeABallx:260 y:260];
      
              
        [self makeAbox];
        
        [self makeAPolygon];
        
        
        [self schedule:@selector(tick:)];
        
    }
    return self;
}

-(void)makeAPolygon{
    
    // Polygon Points --------------
    b2Vec2 vertices[6];
    vertices[0].Set(0.0f, 0.0f);
    vertices[1].Set(1.3f, 1.0f);
    vertices[2].Set(1.3f, 2.0f);
    vertices[3].Set(0.0f, 4.0f);
    vertices[4].Set(-1.3f, 2.0f);
    vertices[5].Set(-1.3f, 1.0f);
    
    int32 count = 6;
    
    
    
    b2Body *_body;
    
    // Polygon --------------
    b2PolygonShape shape;
    shape.Set(vertices,count);
    
    b2BodyDef bd;
    bd.type = b2_dynamicBody;
    bd.position.Set(300/PTM_RATIO,200/PTM_RATIO);
    _body = _world->CreateBody(&bd);
    
    // Create shape definition and add to body
    b2FixtureDef shapeDef;
    shapeDef.shape = &shape;
    shapeDef.density = 10.0f;
    shapeDef.friction = 0.4f;
    shapeDef.restitution = 0.2f;
    _body->CreateFixture(&shapeDef);
}

-(void)makeAbox{
    
    b2Body *_body;
    
    // Create box body
    b2BodyDef boxBodyDef;
    boxBodyDef.type = b2_dynamicBody;
    boxBodyDef.position.Set(200/PTM_RATIO, 200/PTM_RATIO);
    _body = _world->CreateBody(&boxBodyDef);
    
    // Create box shape set size
    b2PolygonShape boxShape;
    boxShape.SetAsBox(10/PTM_RATIO, 
                      10/PTM_RATIO);
    
    // Create shape definition and add to body
    b2FixtureDef boxShapeDef;
    boxShapeDef.shape = &boxShape;
    boxShapeDef.density = 10.0f;
    boxShapeDef.friction = 0.4f;
    boxShapeDef.restitution = 0.8f;
    _body->CreateFixture(&boxShapeDef);
}

-(void)makeABallx:(float)x y:(float)y{
    
    b2Body *_body;
    
    // Create ball body and shape 
    b2BodyDef ballBodyDef;
    ballBodyDef.type = b2_dynamicBody;
    ballBodyDef.position.Set(x/PTM_RATIO, y/PTM_RATIO);
    _body = _world->CreateBody(&ballBodyDef);
    
    b2CircleShape circle;
    circle.m_radius = 5.0/PTM_RATIO;
    
    b2FixtureDef ballShapeDef;
    ballShapeDef.shape = &circle;
    ballShapeDef.density = 1.0f;
    ballShapeDef.friction = 0.2f;
    ballShapeDef.restitution = 0.8f;
    _body->CreateFixture(&ballShapeDef);
}

- (void)tick:(ccTime) dt {
    _world->Step(dt, 10, 10);
}

// Dedug Draw
-(void) draw
{
	[super draw];	
	ccGLEnableVertexAttribs( kCCVertexAttribFlag_Position );
	kmGLPushMatrix();
	_world->DrawDebugData();	
	kmGLPopMatrix();
}

- (void)dealloc {    
    delete _world;
    _world = NULL;
    [super dealloc];
}

@end
