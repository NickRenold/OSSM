// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ZZLog.m instead.

#import "_ZZLog.h"

const struct ZZLogAttributes ZZLogAttributes = {
	.endTime = @"endTime",
	.name = @"name",
	.startTime = @"startTime",
};

const struct ZZLogRelationships ZZLogRelationships = {
	.accelerometerLogEntries = @"accelerometerLogEntries",
	.cameraLogEntries = @"cameraLogEntries",
	.microphoneLogEntries = @"microphoneLogEntries",
};

const struct ZZLogFetchedProperties ZZLogFetchedProperties = {
};

@implementation ZZLogID
@end

@implementation _ZZLog

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ZZLog" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ZZLog";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ZZLog" inManagedObjectContext:moc_];
}

- (ZZLogID*)objectID {
	return (ZZLogID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic endTime;






@dynamic name;






@dynamic startTime;






@dynamic accelerometerLogEntries;

	
- (NSMutableSet*)accelerometerLogEntriesSet {
	[self willAccessValueForKey:@"accelerometerLogEntries"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"accelerometerLogEntries"];
  
	[self didAccessValueForKey:@"accelerometerLogEntries"];
	return result;
}
	

@dynamic cameraLogEntries;

	

@dynamic microphoneLogEntries;

	






@end
