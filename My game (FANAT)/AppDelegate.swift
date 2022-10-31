//
//  AppDelegate.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 04.01.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Точка переопределения для настройки после запуска приложения.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Вызывается при создании нового сеанса сцены.
                // Используйте этот метод, чтобы выбрать конфигурацию для создания новой сцены.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Вызывается, когда пользователь отменяет сеанс сцены.
                // Если какие-либо сеансы были сброшены, пока приложение не работало, это будет вызвано вскоре после
        
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
        Постоянный контейнер для приложения. Эта реализация
        создает и возвращает контейнер, загрузив хранилище для
        приложение к нему. Это свойство является необязательным, поскольку существуют законные
        условия ошибки, которые могут привести к сбою создания хранилища.
                */
        let container = NSPersistentContainer(name: "My_game__FANAT_")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
             
            // fatalError() заставляет приложение генерировать журнал сбоев и завершать работу. Вы не должны использовать эту функцию в отгрузочном приложении, хотя она может быть полезна во время разработки.
                                 
            /*
                                 Типичные причины ошибки здесь включают:
                 * Родительский каталог не существует, не может быть создан или запрещает запись.
                 * Постоянное хранилище недоступно из-за разрешений или защиты данных, когда устройство заблокировано.
                 * Устройство закончилось.
                 * Магазин не мог быть перенесен на текущую версию модели.
                 Проверьте сообщение об ошибке, чтобы определить, в чем заключалась реальная проблема.
                                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Замените эту реализацию кодом для правильной обработки ошибки.
                // fatalError() заставляет приложение генерировать журнал сбоев и завершать работу. Вы не должны использовать эту функцию в отгрузочном приложении, хотя она может быть полезна во время разработки.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

