// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ZZServerObject.h instead.

#import <CoreData/CoreData.h>


extern const struct ZZServerObjectAttributes {
	 NSString *needsUpload;
} ZZServerObjectAttributes;

extern const struct ZZServerObjectRelationships {
} ZZServerObjectRelationships;

extern const struct ZZServerObjectFetchedProperties {
} ZZServerObjectFetchedProperties;




@interface ZZServerObjectID : NSManagedObjectID {}
@end

@interface _ZZServerObject : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ZZServerObjectID*)objectID;




@property (nonatomic, retain) NSNumber *needsUpload;


@property BOOL needsUploadValue;
- (BOOL)needsUploadValue;
- (void)setNeedsUploadValue:(BOOL)value_;

//- (BOOL)validateNeedsUpload:(id*)value_ error:(NSError**)error_;






@end

@interface _ZZServerObject (CoreDataGeneratedAccessors)

@end

@interface _ZZServerObject (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber *)primitiveNeedsUpload;
- (void)setPrimitiveNeedsUpload:(NSNumber *)value;

- (BOOL)primitiveNeedsUploadValue;
- (void)setPrimitiveNeedsUploadValue:(BOOL)value_;




@end
