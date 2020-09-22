//
//  SceneDelegate.swift
//  MapApp
//
//  Created by Кирилл Титов on 30.08.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	let appCoordinator = AppCoordinator()

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowScene = (scene as? UIWindowScene) else { return }

		window = UIWindow(windowScene: windowScene)

		self.appCoordinator.start(window: window!)
	}

	func sceneDidDisconnect(_ scene: UIScene) {
		// Called as the scene is being released by the system.
		// This occurs shortly after the scene enters the background, or when its session is discarded.
		// Release any resources associated with this scene that can be re-created the next time the scene connects.
		// The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
		sendNotificationRequest(content: makeNotificationContent(), trigger: makeNotificationTrigger())
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
		window?.viewWithTag(1001)?.removeFromSuperview()
		// Called when the scene has moved from an inactive state to an active state.
		// Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
	}

	func sceneWillResignActive(_ scene: UIScene) {
		let blurEffect = UIBlurEffect(style: .extraLight)
		let blerView = UIVisualEffectView(effect: blurEffect)
		if let rootViewController = window?.rootViewController {
			blerView.frame = rootViewController.view.bounds
			blerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
			blerView.tag = 1001
			window?.addSubview(blerView)
		}

		sendNotificationRequest(content: makeNotificationContent(), trigger: makeNotificationTrigger())
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
		
		// Called as the scene transitions from the background to the foreground.
		// Use this method to undo the changes made on entering the background.
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
		// Called as the scene transitions from the foreground to the background.
		// Use this method to save data, release shared resources, and store enough scene-specific state information
		// to restore the scene back to its current state.
	}

	func makeNotificationContent() -> UNNotificationContent {
		let content = UNMutableNotificationContent()

		content.title = "⚠️ Приложение скрыто ⚠️"
		content.subtitle = "Последний шанс вернуться !"

		content.badge = 1

		return content
	}

	func makeNotificationTrigger() -> UNNotificationTrigger {
		return UNTimeIntervalNotificationTrigger(timeInterval: 60*30, repeats: false)
	}

	func sendNotificationRequest(content: UNNotificationContent, trigger: UNNotificationTrigger) {
		let request = UNNotificationRequest(identifier: "alarm", content: content, trigger: trigger)

		let center = UNUserNotificationCenter.current()

		center.add(request) { error in
			if let error = error {
				print(error.localizedDescription)
			}
		}
	}
}
