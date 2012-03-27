// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ZZSession.m instead.

#import "_ZZSession.h"

const struct ZZSessionAttributes ZZSessionAttributes = {
	.alarmTime = @"alarmTime",
	.emailAddress = @"emailAddress",
	.logAccelerometer = @"logAccelerometer",
	.logMicrophone = @"logMicrophone",
};

const struct ZZSessionRelationships ZZSessionRelationships = {
};

const struct ZZSessionFetchedProperties ZZSessionFetchedProperties = {
};

@implementation ZZSessionID
@end

@implementation _ZZSession

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ZZSession" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ZZSession";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ZZSession" inManagedObjectContext:moc_];
}

- (ZZSessionID*)objectID {
	return (ZZSessionID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"logAccelerometerValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"logAccelerometer"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"logMicrophoneValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"logMicrophone"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic alarmTime;






@dynamic emailAddress;






@dynamic logAccelerometer;



- (BOOL)logAccelerometerValue {
	NSNumber *result = [self logAccelerometer];
	return [result boolValue];
}

- (void)setLogAccelerometerValue:(BOOL)value_ {
	[self setLogAccelerometer:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveLogAccelerometerValue {
	NSNumber *result = [self primitiveLogAccelerometer];
	return [result boolValue];
}

- (void)setPrimitiveLogAccelerometerValue:(BOOL)value_ {
	[self setPrimitiveLogAccelerometer:[NSNumber numberWithBool:value_]];
}





@dynamic logMicrophone;



- (BOOL)logMicrophoneValue {
	NSNumber *result = [self logMicrophone];
	return [result boolValue];
}

- (void)setLogMicrophoneValue:(BOOL)value_ {
	[self setLogMicrophone:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveLogMicrophoneValue {
	NSNumber *result = [self primitiveLogMicrophone];
	return [result boolValue];
}

- (void)setPrimitiveLogMicrophoneValue:(BOOL)value_ {
	[self setPrimitiveLogMicrophone:[NSNumber numberWithBool:value_]];
}










@end
