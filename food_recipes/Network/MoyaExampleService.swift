import Moya

enum MoyaExampleService {
    case getRecipes
}

extension MoyaExampleService: TargetType {
        
    var baseURL: URL { return URL(string: "https://api.edamam.com")! }
    
    var path: String {
        switch self {
        case .getRecipes:
            return "/api/recipes/v2"
        }
    }
        
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getRecipes:
            return .requestParameters(parameters: ["type": "public", "q": "chicken", "app_id": "b528857e", "app_key": "259e86392961c89ca3a15be3dcab7a0f"], encoding: URLEncoding.default)
            
        }
    }

    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}

