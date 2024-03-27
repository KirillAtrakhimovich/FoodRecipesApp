import Moya

enum MoyaExampleService {
    case getRecipes(input: GetRecipesInput)
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
        case .getRecipes(let input):
            var parameters = ["type": "public", "app_id": "b528857e", "app_key": "259e86392961c89ca3a15be3dcab7a0f"]
            if let search = input.search { parameters["q"] = search }
            if let random = input.random { parameters["random"] = random.description }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}

