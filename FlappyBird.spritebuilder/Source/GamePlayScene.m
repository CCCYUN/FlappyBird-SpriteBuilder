#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    // load a new Character from the CCB file we created for named Character - Yun
    character = (Character*)[CCBReader load:@"Character"];
    // add character as a child of physicsNode
    [physicsNode addChild:character];
    
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

// put new methods here
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // this will get called every time the player touches the screen
    [character flap];
}

- (void)update:(CCTime)delta
{
    // this will be run every frame.
    // delta is the time that has elapsed since the last time it was run. This is usually 1/60, but can be bigger if the game slows down
    // Increment the time since the last obstacle was added
    timeSinceObstacle += delta; // delta is approximately 1/60th of a second
    
    // Check to see if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        // Add a new obstacle
        [self addObstacle];
        
        // Then reset the timer.
        timeSinceObstacle = 0.0f;
    }
}



@end