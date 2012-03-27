// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ZZServerObject.m instead.

#import "_ZZServerObject.h"

const struct ZZServerObjectAttributes ZZServerObjectAttributes = {
	.needsUpload = @"needsUpload",
};

const struct ZZServerObjectRelationships ZZServerObjectRelationships = {
};

const struct ZZServerObjectFetchedProperties ZZServerObjectFetchedProperties = {
};

@implementation ZZServerObjectID
@end

@implementation _ZZServerObject

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ZZServerObject" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ZZServerObject";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ZZServerObject" inManagedObjectContext:moc_];
}

- (ZZServerObjectID*)objectID {
	return (ZZServerObjectID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"needsUploadValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"needsUpload"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic needsUpload;



- (BOOL)needsUploadValue {
	NSNumber *result = [self needsUpload];
	return [result boolValue];
}

- (void)setNeedsUploadValue:(BOOL)value_ {
	[self setNeedsUpload:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveNeedsUploadValue {
	NSNumber *result = [self primitiveNeedsUpload];
	return [result boolValue];
}

- (void)setPrimitiveNeedsUploadValue:(BOOL)value_ {
	[self setPrimitiveNeedsUpload:[NSNumber numberWithBool:value_]];
}










@end
