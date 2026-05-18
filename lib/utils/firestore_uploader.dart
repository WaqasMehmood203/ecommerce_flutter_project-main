import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproject/data/services/sample_seed_data.dart';

class FirestoreUploader {
	static final FirebaseFirestore _db = FirebaseFirestore.instance;

	static Future<bool> seedIfEmpty() async {
		await seedAllSampleData();
		final productsSnapshot = await _db.collection('products').limit(1).get();
		if (productsSnapshot.docs.isNotEmpty) return false;

		return true;
	}

	static Future<void> seedAllSampleData() async {
		final batch = _db.batch();

		for (final category in seedCategories) {
			final id = category['id'] as String;
			final payload = Map<String, dynamic>.from(category)..remove('id');
			batch.set(_db.collection('Categories').doc(id), payload, SetOptions(merge: true));
		}

		for (final brand in seedBrands) {
			final id = brand['id'] as String;
			final payload = Map<String, dynamic>.from(brand)..remove('id');
			batch.set(_db.collection('brands').doc(id), payload, SetOptions(merge: true));
		}

		for (final product in seedProducts) {
			final id = product['id'] as String;
			final payload = Map<String, dynamic>.from(product)..remove('id');
			batch.set(_db.collection('products').doc(id), payload, SetOptions(merge: true));
		}

		for (var i = 0; i < seedProductCategory.length; i++) {
			final item = seedProductCategory[i];
			batch.set(
				_db.collection('ProductCategory').doc('pc_${i + 1}'),
				Map<String, dynamic>.from(item),
				SetOptions(merge: true),
			);
		}

		for (var i = 0; i < seedBrandCategory.length; i++) {
			final item = seedBrandCategory[i];
			batch.set(
				_db.collection('BrandCategory').doc('bc_${i + 1}'),
				Map<String, dynamic>.from(item),
				SetOptions(merge: true),
			);
		}

		await batch.commit();
	}
}
